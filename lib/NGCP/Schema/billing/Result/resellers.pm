package NGCP::Schema::billing::Result::resellers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("resellers");


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
  "NGCP::Schema::billing::Result::admins",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "billing_profiles",
  "NGCP::Schema::billing::Result::billing_profiles",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::billing::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::billing::Result::contracts",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "customers",
  "NGCP::Schema::billing::Result::customers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "domain_resellers",
  "NGCP::Schema::billing::Result::domain_resellers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "ncos_levels",
  "NGCP::Schema::billing::Result::ncos_levels",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::billing::Result::orders",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "products",
  "NGCP::Schema::billing::Result::products",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_intercepts",
  "NGCP::Schema::billing::Result::voip_intercept",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_number_block_resellers",
  "NGCP::Schema::billing::Result::voip_number_block_resellers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_numbers",
  "NGCP::Schema::billing::Result::voip_numbers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::resellers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<resellers>

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

Related object: L<NGCP::Schema::billing::Result::admins>

=head2 billing_profiles

Type: has_many

Related object: L<NGCP::Schema::billing::Result::billing_profiles>

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contracts>

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::billing::Result::contracts>

=head2 customers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::customers>

=head2 domain_resellers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::domain_resellers>

=head2 ncos_levels

Type: has_many

Related object: L<NGCP::Schema::billing::Result::ncos_levels>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::billing::Result::orders>

=head2 products

Type: has_many

Related object: L<NGCP::Schema::billing::Result::products>

=head2 voip_intercepts

Type: has_many

Related object: L<NGCP::Schema::billing::Result::voip_intercept>

=head2 voip_number_block_resellers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::voip_number_block_resellers>

=head2 voip_numbers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::voip_numbers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TiilZCjJa2Id6DkMO8ncsg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
