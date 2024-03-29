package NGCP::Schema::Result::acl_roles;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.acl_roles");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "role",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "is_acl",
  {
    data_type => "tinyint",
    is_nullable => 0,
    default_value => 0
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("role_idx", ["role"]);

__PACKAGE__->has_many(
  "admins",
  "NGCP::Schema::Result::admins",
  { "foreign.role_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "acl_role_mappings",
  "NGCP::Schema::Result::billing_acl_role_mappings",
  { "foreign.accessor_id" => "self.id" },
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

NGCP::Schema::Result::acl_roles

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.acl_roles".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.acl_roles>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 role

  data_type => "varchar",
  is_nullable => 0,
  size => 64

=head2 is_acl

  data_type => "tinyint",
  is_nullable => 0,
  default_value => 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<role_idx>

=over 4

=item * L</role>

=back

=head1 RELATIONS

=head2 acl_role_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::acl_role_mappings>

=head2 admins

Type: has_many

Related object: L<NGCP::Schema::Result::admins>

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
