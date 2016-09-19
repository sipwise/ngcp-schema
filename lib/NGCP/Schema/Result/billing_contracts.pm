package NGCP::Schema::Result::billing_contracts;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.contracts");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "customer_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "order_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "profile_package_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["pending", "active", "locked", "terminated"] },
    is_nullable => 0,
  },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "activate_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "terminate_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "max_subscribers",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "send_invoice",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "subscriber_email_template_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "passreset_email_template_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "invoice_email_template_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "invoice_template_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "vat_rate",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "add_vat",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "contact",
  "NGCP::Schema::Result::contacts",
  { id => "contact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "contract_balances",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "contract_fraud_preference",
  "NGCP::Schema::Result::contract_fraud_preferences",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "contract_registers",
  "NGCP::Schema::Result::contract_registers",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "customer",
  "NGCP::Schema::Result::billing_customers",
  { id => "customer_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "invoices",
  "NGCP::Schema::Result::invoices",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "order",
  "NGCP::Schema::Result::billing_orders",
  { id => "order_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "profile_package",
  "NGCP::Schema::Result::profile_packages",
  { id => "profile_package_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->might_have(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "topup_logs",
  "NGCP::Schema::Result::topup_log",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_subscribers",
  "NGCP::Schema::Result::billing_voip_subscribers",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "vouchers",
  "NGCP::Schema::Result::vouchers",
  { "foreign.customer_id" => "self.id" },
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

NGCP::Schema::Result::billing_contracts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<contracts>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 contact_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 profile_package_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["pending","active","locked","terminated"]}
  is_nullable: 0

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 activate_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 terminate_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 max_subscribers

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 send_invoice

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 subscriber_email_template_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 passreset_email_template_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 invoice_email_template_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 invoice_template_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 vat_rate

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 add_vat

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 billing_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::billing_mappings>

=head2 contact

Type: belongs_to

Related object: L<NGCP::Schema::Result::contacts>

=head2 contract_balances

Type: has_many

Related object: L<NGCP::Schema::Result::contract_balances>

=head2 contract_fraud_preference

Type: might_have

Related object: L<NGCP::Schema::Result::contract_fraud_preferences>

=head2 contract_registers

Type: has_many

Related object: L<NGCP::Schema::Result::contract_registers>

=head2 customer

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_customers>

=head2 invoices

Type: has_many

Related object: L<NGCP::Schema::Result::invoices>

=head2 order

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_orders>

=head2 profile_package

Type: belongs_to

Related object: L<NGCP::Schema::Result::profile_packages>

=head2 reseller

Type: might_have

Related object: L<NGCP::Schema::Result::resellers>

=head2 topup_logs

Type: has_many

Related object: L<NGCP::Schema::Result::topup_log>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::Result::billing_voip_subscribers>

=head2 vouchers

Type: has_many

Related object: L<NGCP::Schema::Result::vouchers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/ibYWCNb3YLiKnY36ofMjg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
