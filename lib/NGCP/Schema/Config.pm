package NGCP::Schema::Config;

use strict;
use warnings;

use Sipwise::Base;
use XML::Simple qw();

my $_config;

sub get_config_filename {
    return '/etc/ngcp-panel/provisioning.conf';
}

sub get_config_hash {
    my ($config_file) = @_;
    $config_file //= get_config_filename;
    unless ($_config) {
        my $tmp_config = XML::Simple->new->XMLin($config_file, ForceArray => 0);
        $_config = check_config($tmp_config);
    }
    return $_config;
}

sub check_config {
    my ($config) = @_;
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

1;

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Config - configuration class

=head1 SYNOPSIS

    use NGCP::Schema::Config qw();
    my $c_hashref = NGCP::Schema::Config::get_config_hash();

=head1 DESCRIPTION

Reads a configuration file, provides configuration as structured data.

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2017 by Sipwise GmbH, Austria.

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
