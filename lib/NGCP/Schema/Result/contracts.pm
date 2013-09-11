package NGCP::Schema::Result::contracts;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.005';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


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
    on_delete     => "SET NULL",
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
  "NGCP::Schema::Result::customers",
  { id => "customer_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "order",
  "NGCP::Schema::Result::orders",
  { id => "order_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "voip_subscribers",
  "NGCP::Schema::Result::voip_subscribers",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_pbx_groups",
  "NGCP::Schema::Result::voip_pbx_groups",
  { "foreign.contract_id" => "self.id" },
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

NGCP::Schema::Result::contracts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.contracts>

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 active_reseller

Type: might_have

Related object: L<NGCP::Schema::Result::resellers>

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

Related object: L<NGCP::Schema::Result::customers>

=head2 order

Type: belongs_to

Related object: L<NGCP::Schema::Result::orders>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_subscribers>

=head2 voip_pbx_groups

Type: has_many

Related object: L<NGCP::Schema::Result::voip_pbx_groups>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:M9sf5Sy/nN3bhIaFEtlOWw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
