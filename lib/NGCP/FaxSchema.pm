package NGCP::FaxSchema;

use warnings;
use strict;

use NGCP::Schema::Config qw();

use base 'DBIx::Class::Schema';

our $VERSION = '2.007';

__PACKAGE__->load_classes(
    { 'NGCP::Schema::Result' => [qw/
        provisioning_voip_subscribers
        voip_dbaliases
        voip_fax_data
        voip_fax_destinations
        voip_domains
        voip_fax_journal
        voip_fax_preferences
        voip_mail_to_fax_acl
        voip_mail_to_fax_preferences
        voip_mail_to_fax_secret_renew_notify
    /] },
    #default_resultset_class => 'ResultSet',
);

# use DBIx::Class::Storage::DBI;
# DBIx::Class::Storage::DBI->datetime_parser_type('NGCP::Schema::Storage::DateTime::Format::MySQL');

sub connection {
    my ($self, $cfg) = @_;
    my $config_file_name;
    if ($cfg->{config_file}) {
        $config_file_name = $cfg->{config_file};
    } else {
        $config_file_name = NGCP::Schema::Config::get_config_filename();
    }
    unless(defined $cfg->{dsn}) {
        my $full_config = NGCP::Schema::Config::get_config_hash($config_file_name);
        $cfg = $full_config->{ngcp_connect_info};
    }
    $self->SUPER::connection($cfg);
}

1;

__END__

=encoding UTF-8

=head1 NAME

NGCP::FaxSchema - Subset of NGCP::Schema loading only a few Result classes

=head1 DESCRIPTION

Use it like NGCP::Schema.

    use NGCP::FaxSchema;
    my $s = NGCP::FaxSchema->connect();

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

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
