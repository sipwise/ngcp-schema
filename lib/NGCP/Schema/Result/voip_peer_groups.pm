package NGCP::Schema::Result::voip_peer_groups;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_peer_groups");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "priority",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "peering_contract_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "has_inbound_rules",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("name", ["name"]);

__PACKAGE__->has_many(
  "voip_peer_hosts",
  "NGCP::Schema::Result::voip_peer_hosts",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_peer_rules",
  "NGCP::Schema::Result::voip_peer_rules",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_peer_inbound_rules",
  "NGCP::Schema::Result::voip_peer_inbound_rules",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { "foreign.id" => "self.peering_contract_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

NGCP::Schema::Result::voip_peer_groups

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_peer_groups".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_peer_groups>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 priority

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 peering_contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<name>

=over 4

=item * L</name>

=back

=head1 RELATIONS

=head2 voip_peer_hosts

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_hosts>

=head2 voip_peer_rules

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_rules>

=head2 voip_peer_inbound_rules

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_inbound_rules>

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
