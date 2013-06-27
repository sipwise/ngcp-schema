package NGCP::Schema::Config;
use Sipwise::Base;
use Log::Log4perl qw();
use MooseX::FileAttribute qw(has_file);
use MooseX::Singleton qw(has);
use XML::Simple qw();

our $VERSION = '1.003';

has_file('config_file', is => 'rw', required => 1, default => '/etc/ngcp-ossbss/provisioning.conf');
has('as_hash', isa => 'HashRef', is => 'rw', lazy => 1, default => method {
    return $self->check_config(XML::Simple->new->XMLin($self->config_file->stringify, ForceArray => 0));
});

method BUILD {
    die q(can't find config file %s)->sprintf($self->config_file)
        unless -e $self->config_file;
    Log::Log4perl->init_once($self->config->{logconf});
    Log::Log4perl->get_logger($self)->info('using config file "%s"'->sprintf($self->config_file));
}

method check_config($config) {
    $config->{vsc}{actions} = [$config->{vsc}{actions}]
      if defined $config->{vsc}
      and defined $config->{vsc}{actions}
      and not defined eval {@{$config->{vsc}{actions}}};
    $config->{credit_warnings} = [$config->{credit_warnings}]
      if defined $config->{credit_warnings} and not defined eval {@{$config->{credit_warnings}}};
    foreach my $warning (eval {@{$config->{credit_warnings}}}) {
        $warning->{recipients} = [$warning->{recipients}]
          if defined $warning->{recipients} and not defined eval {@{$warning->{recipients}}};
    }
    $config->{reserved_usernames} = [$config->{reserved_usernames}]
      if defined $config->{reserved_usernames} and not defined eval {@{$config->{reserved_usernames}}};
    $config->{backends_enabled} = [$config->{backends_enabled}]
      if defined $config->{backends_enabled} and not defined eval {@{$config->{backends_enabled}}};
    $config->{carrier_prov}{backends} = [$config->{carrier_prov}{backends}]
      if defined $config->{carrier_prov}
      and defined $config->{carrier_prov}{backends}
      and not defined eval {@{$config->{carrier_prov}{backends}}};
    return $config;
}

$CLASS->meta->make_immutable;

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Config - configuration class

=head1 VERSION

This document describes NGCP::Schema::Config version 1.003

=head1 SYNOPSIS

    use NGCP::Schema::Config qw();
    my $c_hashref = NGCP::Schema::Config->new;

=head1 DESCRIPTION

Reads a configuration file, initialises the logger, provides configuration as structured data.

=head1 INTERFACE

=head2 Attributes

=head3 C<config_file>

Type C<MooseX::Types::Path::Class>, B<required> attribute, location of the configuration file. Default is
C</etc/ngcp-ossbss/provisioning.conf>.

=head3 C<config>

Type C<HashRef>, supplies configuration from the L</config_file>.

=head2 Methods

=head3 C<check_config>

Takes hashref as just parsed by the configuration file reader and makes sure it is formatted correctly. At the moment,
it only ensures that arrays are arrays even if there is only one member.

=head1 DIAGNOSTICS

=over

=item C<can't find config file %s>

The configuration file does not exist.

=back

=head1 CONFIGURATION AND ENVIRONMENT

See L</config_file>.

The meaning of the configuration items are detailed in the manual.

=head1 DEPENDENCIES

See meta file in the source distribution.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

L<https://bugtracker.sipwise.com>

No known limitations.

=head1 AUTHOR

Lars Dieckow C<< <ldieckow@sipwise.com> >>

=head1 LICENCE

restricted
