package NGCP::Schema::provisioning;
use Sipwise::Base;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZXzIpOFDxVoY7UfJoB1ddg

use NGCP::Schema qw();
use aliased 'NGCP::Schema::Exception';

method _get_domain_id($domain) {
    my $domainid = $self->resultset('voip_domains')->search(id => $domain)->first->id;
    Exception->throw({
        description => 'Client.Voip.NoSuchDomain',
        message => "domain '$domain' does not exist",
        context => {object => $domain}
    }) unless defined $domainid;
    return $domainid;
}

method create_domain($data) {
# FIXME MXMS validation should throw objects
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $data->{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless NGCP::Schema->new->check_domain({domain => $data->{domain}});
# /FIXME

    $self->txn_do(λ{
        # FIXME ack-basswards exception check: abused for control flow
        eval {
            $self->_get_domain_id($data->{domain});
            1;
        } and Exception->throw({
            description => 'Client.Voip.ExistingDomain',
            message => "domain '$data->{domain}' already exists in the operations database",
            context => {object => $data->{domain}},
        });
        $self->resultset('voip_domains')->create({domain => $data->{domain}});
    });
    $self->_sip_domain_reload;
    return;
}

method get_domain($data) {
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $$data{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless NGCP::Schema->new->check_domain({domain => $data->{domain}});
    return $self->resultset('voip_domains')->search(id => $self->_get_domain_id($data->{domain}));
}

method update_domain($data) {
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $data->{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless NGCP::Schema->new->check_domain({domain => $data->{domain}});
    $self->txn_do(λ{
        my $domainid = $self->_get_domain_id($data->{domain});
    });
    $self->_sip_domain_reload;
    return;
}

method delete_domain($data) {
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => "missing parameter 'domain' in request",
    }) unless exists $data->{domain};
    Exception->throw({
        description => 'Client.Syntax.MalformedDomain',
        message => "malformed domain '$data->{domain}' in request",
    }) unless NGCP::Schema->new->check_domain({domain => $data->{domain}});
    $self->txn_do(λ{
        my $domainid = $self->_get_domain_id($data->{domain});
        $self->resultset('voip_domains')->search(
            {},
            {
                id => $domainid
            }
        )->delete_all;
    });
    $self->_sip_domain_reload;
    return;
}

$CLASS->meta->make_immutable(inline_constructor => 0);

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning - provisioning schema

=head1 VERSION

This document describes NGCP::Schema::provisioning version 1.000

=head1 SYNOPSIS

    use NGCP::Schema::provisioning qw();

=head1 DESCRIPTION

This is a port of F<lib/Sipwise/Provisioning/Voip.pm> and
F<lib/Sipwise/Provisioning/Voip/DB.pm> in F<svn/dev/ngcp/ossbss>.

=head1 INTERFACE

=head2 Composition

    NGCP::Schema::provisioning
        ISA DBIx::Class::Schema

All methods and attributes not mentioned here are inherited from
L<DBIx::Class::Schema>.

=head2 Attributes

None.

=head2 Methods

=head3 C<get_domain>

    get_domain($data)

This method retrieves a domain from the DB. Returns a fault if the
domain can not be found in the database.

=head3 C<create_domain>

    create_domain($data)

This function creates a new domain in the database.

=head3 C<update_domain>

    update_domain($data)

This function modifies a domain in the database. As there is no domain
data at the moment, this function does nothing but check whether the
domain exists.

=head3 C<delete_domain>

    delete_domain($data)

This function deletes a domain from the database. Will delete all
subscribers that use this domain too!
Returns a fault if the domain can not be found in the database.

=head2 Exports

None.

=head1 DIAGNOSTICS

All exceptions are of type L<NGCP::Schema::Exception>. They are listed by
their C<message> attribute.

=head2 C<domain '%s' does not exist>

C<description> attribute is C<Client.Voip.NoSuchDomain>

=head2 C<missing parameter 'domain' in request>

C<description> attribute is C<Client.Syntax.MissingParam>

=head2 C<malformed domain '%s' in request>

C<description> attribute is C<Client.Syntax.MalformedDomain>

=head2 C<missing parameter 'domain' in request>

C<description> attribute is C<Client.Syntax.MissingParam>

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
