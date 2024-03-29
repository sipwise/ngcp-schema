package NGCP::Schema::Result::voip_peer_hosts;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_peer_hosts");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "host",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "port",
  { data_type => "integer", default_value => 5060, is_nullable => 0 },
  "transport",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "weight",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "via_route",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "via_lb",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "enabled",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "probe",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("grpname", ["group_id", "name"]);

__PACKAGE__->belongs_to(
  "group",
  "NGCP::Schema::Result::voip_peer_groups",
  { id => "group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "voip_peer_preferences",
  "NGCP::Schema::Result::voip_peer_preferences",
  { "foreign.peer_host_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "lcr_gw",
  "NGCP::Schema::Result::lcr_gw",
  { "foreign.id" => "self.id" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_peer_hosts

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_peer_hosts".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_peer_hosts>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 host

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 port

  data_type: 'integer'
  default_value: 5060
  is_nullable: 0

=head2 transport

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 weight

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 via_lb

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<grpname>

=over 4

=item * L</group_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_peer_groups>

=head2 voip_peer_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_preferences>

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2017 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this package.  If not, see <https://www.gnu.org/licenses/>.
