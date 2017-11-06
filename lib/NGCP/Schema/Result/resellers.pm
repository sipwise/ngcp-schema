package NGCP::Schema::Result::resellers;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.resellers");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 63 },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "locked", "terminated"] },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("contractid_idx", ["contract_id"]);

__PACKAGE__->add_unique_constraint("name_idx", ["name"]);

__PACKAGE__->has_many(
  "admins",
  "NGCP::Schema::Result::admins",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_profiles",
  "NGCP::Schema::Result::billing_profiles",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "customers",
  "NGCP::Schema::Result::customers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "domain_resellers",
  "NGCP::Schema::Result::domain_resellers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "ncos_levels",
  "NGCP::Schema::Result::ncos_levels",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::orders",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "products",
  "NGCP::Schema::Result::products",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_intercepts",
  "NGCP::Schema::Result::voip_intercept",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_number_block_resellers",
  "NGCP::Schema::Result::voip_number_block_resellers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_numbers",
  "NGCP::Schema::Result::voip_numbers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_sound_sets",
  "NGCP::Schema::Result::voip_sound_sets",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_rewrite_rule_sets",
  "NGCP::Schema::Result::voip_rewrite_rule_sets",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_subscriber_profile_sets",
  "NGCP::Schema::Result::voip_subscriber_profile_sets",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "autoprov_devices",
  "NGCP::Schema::Result::autoprov_devices",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "branding",
  "NGCP::Schema::Result::reseller_brandings",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "vouchers",
  "NGCP::Schema::Result::vouchers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "email_templates",
  "NGCP::Schema::Result::vouchers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_networks",
  "NGCP::Schema::Result::billing_networks",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "profile_packages",
  "NGCP::Schema::Result::profile_packages",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "rtc_user",
  "NGCP::Schema::Result::rtc_user",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "emergency_containers",
  "NGCP::Schema::Result::emergency_containers",
  { "foreign.reseller_id" => "self.id" },
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

NGCP::Schema::Result::resellers

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.resellers".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.resellers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 63

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["active","locked","terminated"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<contractid_idx>

=over 4

=item * L</contract_id>

=back

=head2 C<name_idx>

=over 4

=item * L</name>

=back

=head1 RELATIONS

=head2 admins

Type: has_many

Related object: L<NGCP::Schema::Result::admins>

=head2 billing_profiles

Type: has_many

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::contracts>

=head2 customers

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 domain_resellers

Type: has_many

Related object: L<NGCP::Schema::Result::domain_resellers>

=head2 ncos_levels

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_levels>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::orders>

=head2 products

Type: has_many

Related object: L<NGCP::Schema::Result::products>

=head2 voip_intercepts

Type: has_many

Related object: L<NGCP::Schema::Result::voip_intercept>

=head2 voip_number_block_resellers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_number_block_resellers>

=head2 voip_numbers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_numbers>

=head2 rtc_user

Type: might_have

Related object: L<NGCP::Schema::Result::rtc_user>

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
