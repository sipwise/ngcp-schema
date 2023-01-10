package NGCP::Schema::Result::ncos_levels;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.ncos_levels");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "level",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "mode",
  {
    data_type => "enum",
    default_value => "blacklist",
    extra => { list => ["blacklist", "whitelist"] },
    is_nullable => 0,
  },
  "local_ac",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "intra_pbx",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "time_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("reslev_idx", ["reseller_id", "level"]);

__PACKAGE__->has_many(
  "ncos_lnp_lists",
  "NGCP::Schema::Result::ncos_lnp_list",
  { "foreign.ncos_level_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "ncos_pattern_lists",
  "NGCP::Schema::Result::ncos_pattern_list",
  { "foreign.ncos_level_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "timeset",
  "NGCP::Schema::Result::voip_time_sets",
  { id => "time_set_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
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

NGCP::Schema::Result::ncos_levels

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.ncos_levels".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.ncos_levels>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 level

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 mode

  data_type: 'enum'
  default_value: 'blacklist'
  extra: {list => ["blacklist","whitelist"]}
  is_nullable: 0

=head2 local_ac

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 intra_pbx

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 time_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reslev_idx>

=over 4

=item * L</reseller_id>

=item * L</level>

=back

=head1 RELATIONS

=head2 ncos_lnp_lists

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_lnp_list>

=head2 ncos_pattern_lists

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_pattern_list>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=head2 timeset

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_time_sets>

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
