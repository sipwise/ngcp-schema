package NGCP::Schema::Result::voip_header_rules;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_header_rules");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "priority",
  {
    data_type => "integer",
    default_value => 100,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "direction",
  {
    data_type => "enum",
    extra => { list => ["a_inbound", "a_outbound", "local", "peer", "b_outbound", "cf_inbound", "cf_outbound", "reply"] },
    default_value => "inbound",
    is_nullable => 0,
  },
  "stopper",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_nullable => 0,
    default_value => 0,
  },
  "enabled",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_nullable => 0,
    default_value => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "conditions",
  "NGCP::Schema::Result::voip_header_rule_conditions",
  { "foreign.rule_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "actions",
  "NGCP::Schema::Result::voip_header_rule_actions",
  { "foreign.rule_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "ruleset",
  "NGCP::Schema::Result::voip_header_rule_sets",
  { id => "set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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

NGCP::Schema::Result::voip_header_rules

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_header_rules".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_header_rules>

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

Related object: L<NGCP::Schema::Result::voip_header_rule_sets>

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
