package NGCP::Schema::Result::voip_preferences;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_preferences");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "voip_preference_groups_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "attribute",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "label",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "type",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "max_occur",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "usr_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "prof_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "dom_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "peer_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "contract_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "contract_location_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "dev_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "devprof_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "fielddev_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "internal",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "expose_to_customer",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "data_type",
  {
    data_type => "enum",
    extra => { list => ["boolean", "int", "string", "enum"] },
    is_nullable => 1,
  },
  "read_only",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "customer_defined",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("attribute_idx", ["attribute"]);

__PACKAGE__->has_many(
  "voip_dom_preferences",
  "NGCP::Schema::Result::voip_dom_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_peer_preferences",
  "NGCP::Schema::Result::voip_peer_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_dev_preferences",
  "NGCP::Schema::Result::voip_dev_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_devprof_preferences",
  "NGCP::Schema::Result::voip_devprof_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_fielddev_preferences",
  "NGCP::Schema::Result::voip_dev_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "voip_preference_group",
  "NGCP::Schema::Result::voip_preference_groups",
  { id => "voip_preference_groups_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "voip_preferences_enums",
  "NGCP::Schema::Result::voip_preferences_enum",
  { "foreign.preference_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_usr_preferences",
  "NGCP::Schema::Result::voip_usr_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_prof_preferences",
  "NGCP::Schema::Result::voip_prof_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_contract_preferences",
  "NGCP::Schema::Result::voip_contract_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(#?
  "voip_preference_relations",
  "NGCP::Schema::Result::voip_preference_relations",
  { "foreign.voip_preference_id" => "self.id" },
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

NGCP::Schema::Result::voip_preferences

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_preferences".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 voip_preference_groups_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 attribute

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 type

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 max_occur

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 usr_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 dom_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 peer_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 internal

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 expose_to_customer

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 data_type

  data_type: 'enum'
  extra: {list => ["boolean","int","string","enum"]}
  is_nullable: 1

=head2 read_only

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<attribute_idx>

=over 4

=item * L</attribute>

=back

=head1 RELATIONS

=head2 voip_dom_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_dom_preferences>

=head2 voip_peer_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_preferences>

=head2 voip_preference_group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_preference_groups>

=head2 voip_preferences_enums

Type: has_many

Related object: L<NGCP::Schema::Result::voip_preferences_enum>

=head2 voip_usr_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_usr_preferences>

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
