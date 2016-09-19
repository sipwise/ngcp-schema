package NGCP::Schema::Result::resellers;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


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
  "billing_networks",
  "NGCP::Schema::Result::billing_networks",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "billing_profiles",
  "NGCP::Schema::Result::billing_profiles",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contacts",
  "NGCP::Schema::Result::contacts",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::billing_contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "customers",
  "NGCP::Schema::Result::billing_customers",
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
  "email_templates",
  "NGCP::Schema::Result::email_templates",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "invoice_templates",
  "NGCP::Schema::Result::invoice_templates",
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
  "NGCP::Schema::Result::billing_orders",
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
  "profile_packages",
  "NGCP::Schema::Result::profile_packages",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "reseller_branding",
  "NGCP::Schema::Result::reseller_brandings",
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
  "vouchers",
  "NGCP::Schema::Result::vouchers",
  { "foreign.reseller_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::resellers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

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

Related object: L<NGCP::Schema::Result::admins>

=head2 billing_networks

Type: has_many

Related object: L<NGCP::Schema::Result::billing_networks>

=head2 billing_profiles

Type: has_many

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 contacts

Type: has_many

Related object: L<NGCP::Schema::Result::contacts>

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_contracts>

=head2 customers

Type: has_many

Related object: L<NGCP::Schema::Result::billing_customers>

=head2 domain_resellers

Type: has_many

Related object: L<NGCP::Schema::Result::domain_resellers>

=head2 email_templates

Type: has_many

Related object: L<NGCP::Schema::Result::email_templates>

=head2 invoice_templates

Type: has_many

Related object: L<NGCP::Schema::Result::invoice_templates>

=head2 ncos_levels

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_levels>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::billing_orders>

=head2 products

Type: has_many

Related object: L<NGCP::Schema::Result::products>

=head2 profile_packages

Type: has_many

Related object: L<NGCP::Schema::Result::profile_packages>

=head2 reseller_branding

Type: might_have

Related object: L<NGCP::Schema::Result::reseller_brandings>

=head2 voip_intercepts

Type: has_many

Related object: L<NGCP::Schema::Result::voip_intercept>

=head2 voip_number_block_resellers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_number_block_resellers>

=head2 voip_numbers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_numbers>

=head2 vouchers

Type: has_many

Related object: L<NGCP::Schema::Result::vouchers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4g7uesKVIaSYqgEEcp5OtA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
