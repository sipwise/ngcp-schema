package NGCP::Schema::billing;
use Sipwise::Base;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pFNyB1lQTWbvEckC6oqjJw

use MooseX::ClassAttribute qw(class_has);
use NGCP::Schema qw();
use NGCP::Schema::provisioning qw();
use aliased 'NGCP::Schema::Exception';

class_has('config', is => 'rw', isa => 'NGCP::Schema::Config', lazy => 1, default => sub {
    return NGCP::Schema::Config->instance;
});
has('validator', is => 'rw', isa => 'NGCP::Schema', lazy => 1, default => sub { return NGCP::Schema->new; });
has('provisioning', is => 'rw', isa => 'NGCP::Schema::provisioning', lazy => 1, default => sub {
    return NGCP::Schema::provisioning->connect;
});

method connection {
    my %connect_info = %{ $self->config->as_hash->{billingdb} };
    $self->SUPER::connection(@connect_info{qw(dsn username password)});
}

method get_domain($reseller_id, $domain) {
    my %return;
    $return{domain} = $domain;
    try {
        $return{id} = $self->resultset('domains')->search(
            {
                domain => $domain,
                defined($reseller_id)
                    ? (
                        'domain_resellers.domain_id' => {-ident => 'me.id'},
                        'domain_resellers.reseller_id' => $reseller_id,
                    )
                    : ()
            },
            {
                join   => 'domain_resellers',
                select => [{distinct => ['me.id']}],
                as     => ['id'],
            }
        )->single->id;
    };
    Exception->throw({
        description => 'Client.Voip.NoSuchDomain',
        message => "unknown domain '$domain'",
        context => {object => $domain},
    }) unless defined $return{id} and $return{id};
    $return{resellers} = [
        map { $_->reseller_id }
        $self->resultset('domain_resellers')->search(
            {
                domain_id   => $return{id},
                reseller_id => {-ident => 'reseller.id'},
                status      => {q{!=} => 'terminated'},
            },
            {
                join    => 'reseller',
                columns => ['reseller_id'],
            }
        )->all
    ] unless $reseller_id;
    $return{subscribers} = {
        map { $_->status => $_->get_column('count') }
        $self->resultset('voip_subscribers')->search({
                domain_id   => $return{id},
                contract_id => {-ident => 'contract.id'},
                defined($reseller_id)
                    ? ('contract.reseller_id' => $reseller_id)
                    : ()
            },
            {
                select   => ['status', {count => '*', -as => 'count'},],
                join     => 'contract',
                group_by => ['status'],
            }
        )->all
    };
    for my $status (qw(active locked terminated)) {
        $return{subscribers}{$status} = 0 unless exists $return{subscribers}{$status};
    }
    return \%return;
}

method create_domain($data, $reseller_id?) {
# FIXME MXMS validation should throw objects
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $data->{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless $self->validator->check_domain({domain => $data->{domain}});
# /FIXME
    $self->txn_do(sub {
        # just to verify the domain does not exist for the reseller
        my $dbdom;
        try {
            $dbdom = $self->get_domain($reseller_id, $data->{domain});
        };
        if (defined $dbdom) {
            Exception->throw({
                description => 'Client.Voip.ExistingDomain',
                message => "domain '$data->{domain}' already exists in the billing database",
                context => {object => $data->{domain}},
            });
        }
        # see if the domain exists at all
        # this forces domains to be unique!
        # we need this to simplify our overall data structure a bit
        # at least our voip_dom_preferences are partially depending on it
        try {
            $dbdom = $self->get_domain(undef, $data->{domain});
        };
        if (defined $dbdom) {
            Exception->throw({
                description => 'Client.Voip.ExistingDomain',
                message => "domain '$data->{domain}' already in use by another reseller",
                context => {object => $data->{domain}},
            });
        }
        # FIXME why does it test for $dbdom again? didn't we just above leave flow control?
        if (defined $dbdom) {
            $self->resultset('domain_resellers')->create({
                domain_id => $dbdom->{id},
                reseller_id => $reseller_id,
            }) if defined $reseller_id;
        } else {
            # FIXME see docs about create: "keyed on the relationship name"
            my $row = $self->resultset('domains')->create({domain => $data->{domain}});
            $self->resultset('domain_resellers')->create({
                domain_id => $row->id,
                reseller_id => $reseller_id,
            }) if defined $reseller_id;
        }
        # domain may already exist in provisioning DB if another reseller uses it
        my $provisioning = $self->provisioning;
        my $dom;
        try {
            $dom = $provisioning->get_domain({domain => $data->{domain}});
        };
        if (defined $dom) {
            $provisioning->update_domain($data);
        } else {
            $provisioning->create_domain($data);
        }
    });
    return;
}

method delete_domain($data, $reseller_id) {
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $data->{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless $self->validator->check_domain({domain => $data->{domain}});
    $self->txn_do(sub {
        my $remaining_resellers = $self->delete_domain($reseller_id, $data->{domain});
        unless ($remaining_resellers) {
            # just to verify the domain exists
            my $dbdom = $self->get_domain($reseller_id, $data->{domain});
            $self->resultset('domain_resellers')->search(
                {
                    domain_id => $dbdom->{id},
                    defined($reseller_id)
                        ? (reseller => $reseller_id)
                        : (),
                }
            )->delete_all;
            my $dc = $self->resultset('domain_resellers')->search(
                {
                    domain_id => $dbdom->{id},
                }
            )->count;
            if ($dc == 0) {
                # remove contracts and subscribers first
                $self->_delete_domain_contracts_and_subscribers($dbdom->{id}, $reseller_id);
                if ($reseller_id) {
                    # reseller admin, see if another reseller has subscribers
                    # within the domain (as dc==0, they should be terminated ones)
                    my $osc = $self->resultset('voip_subscribers')->search(
                        {
                            contract_id => {-ident => 'contracts.id'},
                            domain_id   => $dbdom->{id},
                            reseller_id => {q{!=} => $reseller_id},
                        },
                        {
                            join => 'contracts',
                        }
                    )->count;
                    if($osc == 0) {
                        # no "foreign" data, delete the complete domain
                        $self->resultset('domains')->find($dbdom->{id})->delete_all;
                    }
                } else {
                    # superuser, delete complete domain
                    $self->resultset('domains')->find($dbdom->{id})->delete_all;
                }
            } else {
                # paranoia
                Exception->throw({
                    description => 'Server.Internal',
                    message => 'reseller_id empty in domain delete, still we have a persisting domain reseller.',
                }) unless $reseller_id;
                # Oooops! Breaks data encapsulation heinously! :o/
                $self->storage->dbh_do(sub {
                    my (undef, $dbh, @bind) = @_;
                    $dbh->do(
                        'DELETE FROM provisioning.pvs
                            USING provisioning.voip_subscribers pvs
                            INNER JOIN billing.voip_subscribers bvs
                            INNER JOIN billing.contracts bc
                        WHERE pvs.uuid = bvs.uuid
                            AND bvs.contract_id = bc.id
                            AND bvs.domain_id = ?
                            AND bc.reseller_id = ?',
                        {},
                        @bind
                    );
                }, $dbdom->{id}, $reseller_id);
                $self->_delete_domain_contracts_and_subscribers($dbdom->{id}, $reseller_id);
            }
            return $dc;
        }
    });
    return;
}

method _delete_domain_contracts_and_subscribers($domain_id, $reseller_id) {
    # remove contracts which only have subscribers within
    # the domain that is to be deleted
    $self->resultset('contracts')->search(
        {
            'voip_subscribers.contract_id'   => {-ident => 'me.id'},
            'voip_subscribers.domain_id'     => $domain_id,
            'voip_subscribers_2.contract_id' => {-ident => 'me.id'},
            'voip_subscribers_2.domain_id'   => {q{!=} => $domain_id},
            'voip_subscribers_2.domain_id'   => undef,
            defined($reseller_id)
                ? (reseller_id => $reseller_id)
                : ()
        },
        {
            join => ['voip_subscribers', 'voip_subscribers'],
        }
    )->delete_all;
    # delete remaining subscribers within the domain that
    # is to be deleted
    if ($reseller_id) {
        $self->resultset('voip_subscribers')->search(
            {
                contract_id             => {-ident => 'id'},
                'contracts.reseller_id' => $reseller_id,
                domain_id               => $domain_id,
            },
            {
                join => 'contracts'
            }
        )->delete_all;
    } else {
        $self->resultset('voip_subscribers')->search(
            {
                domain_id => $domain_id
            }
        )->delete_all;
    }
    return;
}

$CLASS->meta->make_immutable(inline_constructor => 0);

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::billing - billing schema

=head1 VERSION

This document describes NGCP::Schema::billing version 1.001

=head1 SYNOPSIS

    use NGCP::Schema::billing qw();

=head1 DESCRIPTION

This is a port of F<lib/Sipwise/Provisioning/Billing.pm> and
F<lib/Sipwise/Provisioning/Billing/DB.pm> in F<svn/dev/ngcp/ossbss>.

=head1 INTERFACE

=head2 Composition

    NGCP::Schema::billing
        ISA DBIx::Class::Schema

All methods and attributes not mentioned here are inherited from
L<DBIx::Class::Schema>.

=head2 Attributes

None.

=head2 Methods

=head3 C<get_domain>

    get_domain($reseller_id, $domain)

This method retrieves a domain from the DB. Returns a fault if the
domain can not be found in the database.

=head3 C<create_domain>

    create_domain($data, $reseller_id?)

This function creates a new domain in the database.

=head3 C<delete_domain>

    delete_domain($data, $reseller_id)

This function deletes a domain from the database. Will delete all
subscribers that use this domain too!
Returns a fault if the domain can not be found in the database. On
success, returns the number of remaining domain resellers for the
domain.

=head2 Exports

None.

=head1 DIAGNOSTICS

All exceptions are of type L<NGCP::Schema::Exception>. They are listed by
their C<message> attribute.

=head2 C<unknown domain '%s'>

C<description> attribute is C<Client.Voip.NoSuchDomain>

=head2 C<missing parameter 'domain' in request>

C<description> attribute is C<Client.Syntax.MissingParam>

=head2 C<malformed domain '%s' in request>

C<description> attribute is C<Client.Syntax.MalformedDomain>

=head2 C<domain '%s' already exists in the billing database>

C<description> attribute is C<Client.Voip.ExistingDomain>

=head2 C<domain '%s' already in use by another reseller>

C<description> attribute is C<Client.Voip.ExistingDomain>

=head2 C<reseller_id empty in domain delete, still we have a persisting domain reseller.>

C<description> attribute is C<Server.Internal>

=head1 CONFIGURATION AND ENVIRONMENT

See L<DBI/"DBI ENVIRONMENT VARIABLES">.

=head1 DEPENDENCIES

See meta file in the source distribution.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

L<https://bugtracker.sipwise.com>

No known limitations.

=head1 TO DO

Nothing so far.

=head1 SEE ALSO

L<MooseX::Method::Signatures/"SIGNATURE SYNTAX">

=head1 AUTHOR

Lars Dieckow C<< <ldieckow@sipwise.com> >>

=head1 LICENCE

restricted
