package NGCP::Schema::Result::products;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.products");

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
  "class",
  {
    data_type => "enum",
    extra => {
      list => [
        "sippeering",
        "pstnpeering",
        "reseller",
        "sipaccount",
        "pbxaccount",
      ],
    },
    is_nullable => 0,
  },
  "handle",
  { data_type => "varchar", is_nullable => 0, size => 63 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "on_sale",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "price",
  { data_type => "double precision", is_nullable => 1 },
  "weight",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "billing_profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("reshand_idx", ["reseller_id", "handle"]);

__PACKAGE__->add_unique_constraint("resnam_idx", ["reseller_id", "name"]);

__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "billing_profile_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
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

NGCP::Schema::Result::products

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.products".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.products>

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

=head2 class

  data_type: 'enum'
  extra: {list => ["sippeering","pstnpeering","reseller","sipaccount","pbxaccount"]}
  is_nullable: 0

=head2 handle

  data_type: 'varchar'
  is_nullable: 0
  size: 63

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 on_sale

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 price

  data_type: 'double precision'
  is_nullable: 1

=head2 weight

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reshand_idx>

=over 4

=item * L</reseller_id>

=item * L</handle>

=back

=head2 C<resnam_idx>

=over 4

=item * L</reseller_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 billing_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::billing_mappings>

=head2 billing_profile

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

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
