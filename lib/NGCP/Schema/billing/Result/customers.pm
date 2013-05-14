package NGCP::Schema::billing::Result::customers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("customers");


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
  "shopuser",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "shoppass",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "business",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "tech_contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "comm_contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
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
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("reseller_id", ["reseller_id", "shopuser"]);


__PACKAGE__->belongs_to(
  "comm_contact",
  "NGCP::Schema::billing::Result::contacts",
  { id => "comm_contact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "contact",
  "NGCP::Schema::billing::Result::contacts",
  { id => "contact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::billing::Result::contracts",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "customer_registers",
  "NGCP::Schema::billing::Result::customer_registers",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::billing::Result::orders",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::billing::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "tech_contact",
  "NGCP::Schema::billing::Result::contacts",
  { id => "tech_contact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::customers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<customers>

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

=head2 shopuser

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 shoppass

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 business

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 contact_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 tech_contact_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 comm_contact_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reseller_id>

=over 4

=item * L</reseller_id>

=item * L</shopuser>

=back

=head1 RELATIONS

=head2 comm_contact

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contacts>

=head2 contact

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contacts>

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::billing::Result::contracts>

=head2 customer_registers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::customer_registers>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::billing::Result::orders>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=head2 tech_contact

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contacts>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8mpGeT9ZjPmlntgImyTEYQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
