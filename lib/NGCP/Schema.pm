package NGCP::Schema;
use Sipwise::Base;
use aliased 'NGCP::Schema::Exception';
use NGCP::Schema::Config qw();
use Regexp::Common qw(net);
use Regexp::IPv6 qw($IPv6_re);
use MooseX::ClassAttribute qw(class_has);
extends 'DBIx::Class::Schema';

our $VERSION = '2.007';

__PACKAGE__->load_namespaces(
    default_resultset_class => 'ResultSet',
);

class_has('config', is => 'rw', isa => 'NGCP::Schema::Config', lazy => 1, default => sub {
    return NGCP::Schema::Config->instance;
});

sub connection {
    my ($self) = @_;
    $self->SUPER::connection($self->config->as_hash->{ngcp_connect_info});
}

sub validate {
    my ($self, $data, $mandatory_params, $optional_params) = @_;
    Exception->throw({
        description => 'Client.Syntax.MissingParam',
        message => q(missing parameter 'data'),
    }) unless defined $data;
    Exception->throw({
        description => 'Client.Syntax.MalformedParam',
        message => q(parameter 'data' should be an object/hash, but is '%s')->sprintf(ref $data)
    }) unless defined eval { %$data };
    my %check_data = %$data;
    for my $param (@$mandatory_params) {
        Exception->throw({
            description => 'Client.Syntax.MissingParam',
            message => "missing parameter '$param' in request"
        }) unless exists $check_data{$param};
        delete $check_data{$param};
    }
    foreach my $key (keys %check_data) {
        next if grep { $key eq $_ } @$optional_params;
        Exception->throw({
            description => 'Client.Syntax.UnknownParam',
            message => "unknown parameter '$key'",
        });
    }
    return;
}

sub check_domain {
    my ($self, $data) = @_;
    $self->validate($data, ['domain']);
    my $domain = $data->{domain};
    return 1 if $domain =~ /^(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]+$/i;
    return 1 if $self->config->as_hash->{allow_ip_as_domain}
        and ($self->check_ip4({ip4 => $domain}) || $self->check_ip6_brackets({ip6brackets => $domain}));
    return;
}

sub check_ip4 {
    my ($self, $data) = @_;
    $self->validate($data, ['ip4']);
    return $self->_check_ip_generic($data->{ip4}, 1);
}

sub check_ip6 {
    my ($self, $data) = @_;
    $self->validate($data, ['ip6']);
    return $self->_check_ip_generic($data->{ip6}, 2);
}

sub check_ip6_brackets {
    my ($self, $data) = @_;
    $self->validate($data, ['ip6brackets']);
    return $self->_check_ip_generic($data->{ip6brackets}, 4);
}

sub _check_ip_generic {
    my ($self, $ip, $flags) = @_;
    SWITCH: for ($flags) {
        $_ & 1 && return $ip =~ /^$RE{net}{IPv4}$/;
        $_ & 2 && return $ip =~ /^$IPv6_re$/;
        $_ & 4 && return $ip =~ /^\[$IPv6_re\]$/;
        # default
    } # SWITCH
    return;
}

__PACKAGE__->meta->make_immutable;
1;

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema - DBIC-derived ORM schema classes

=head1 VERSION

This document describes NGCP::Schema version 2.007

=head1 SYNOPSIS

    use NGCP::Schema::accounting;
    use NGCP::Schema::billing;
    use NGCP::Schema::carrier;
    use NGCP::Schema::kamailio;
    use NGCP::Schema::ngcp;
    use NGCP::Schema::provisioning;
    use NGCP::Schema::sipstats;

=head1 DESCRIPTION

See
L<NGCP::Schema::accounting>,
L<NGCP::Schema::billing>,
L<NGCP::Schema::carrier>,
L<NGCP::Schema::kamailio>,
L<NGCP::Schema::ngcp>,
L<NGCP::Schema::provisioning>,
L<NGCP::Schema::sipstats>.

=head1 INCOMPATIBILITIES

Version 2 moves the result classes of all tables into one namespace. This means the following table names collide:

    accounting.acc_backup       kamailio.acc_backup
    accounting.acc_trash        kamailio.acc_trash
    accounting.acc              kamailio.acc
    accounting.mark             sipstats.mark
    billing.contracts           carrier.contracts
    billing.customers           carrier.customers
    billing.orders              carrier.orders
    billing.payments            carrier.payments
    billing.voip_subscribers    provisioning.voip_subscribers

This is solved by prefixing the result class name I<on the right-hand side only> with the database name and an
underscore, e.g. table C<provisioning.voip_subscribers> becomes the result class <provisioning_voip_subscribers>.

=head1 BUGS AND LIMITATIONS

L<https://bugtracker.sipwise.com>

=head1 AUTHOR

Lars Dieckow C<< <ldieckow@sipwise.com> >>

=head1 LICENCE

This software is Copyright © 2013 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public
License along with this package; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor,
Boston, MA  02110-1301 USA

On Debian systems, the full text of the GNU General Public
License version 3 can be found in the file
F</usr/share/common-licenses/GPL-3>.
