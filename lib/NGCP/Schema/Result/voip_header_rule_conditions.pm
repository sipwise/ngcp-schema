package NGCP::Schema::Result::voip_header_rule_conditions;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_header_rule_conditions");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "rule_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "header",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "header_part",
  {
    data_type => "enum",
    extra => { list => ["full", "username", "domain", "port"] },
    is_nullable => 0,
    default_value => 'full',
  },
  "expression",
  {
    data_type => "enum",
    extra => { list => ["exists", "is", "contains", "matches", "regexp"] },
    is_nullable => 0,
  },
  "expression_negation",
  {
    data_type => "tinyint",
    is_nullable => 0,
    default_value => 0,
  },
  "value_type",
  {
    data_type => "enum",
    extra => { list => ["input", "preference", "avp"] },
    is_nullable => 0,
  },
  "value_group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "rwr_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
    is_foreign_key => 1,
  },
  "rwr_dp_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
    is_foreign_key => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "value_group",
  "NGCP::Schema::Result::voip_header_rule_condition_value_groups",
  { "foreign.id" => "self.value_group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "values",
  "NGCP::Schema::Result::voip_header_rule_condition_values",
  { "foreign.group_id" => "self.value_group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "rule",
  "NGCP::Schema::Result::voip_header_rules",
  { id => "rule_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "rwr_set",
  "NGCP::Schema::Result::voip_rewrite_rule_sets",
  { id => "rwr_set_id" },
  { is_deferrable => 1, on_delete => "SET NULL" },
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

NGCP::Schema::Result::voip_header_rule_conditions

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_header_rule_conditions".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_header_rule_conditions>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 ruleset

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_header_rule_conditions>

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
