package NGCP::Schema::billing::Result::contract_balances;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("contract_balances");


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
  "cash_balance",
  { data_type => "double precision", is_nullable => 1 },
  "cash_balance_interval",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "free_time_balance",
  { data_type => "integer", is_nullable => 1 },
  "free_time_balance_interval",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "invoice_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::billing::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "contract_credits",
  "NGCP::Schema::billing::Result::contract_credits",
  { "foreign.balance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "invoice",
  "NGCP::Schema::billing::Result::invoices",
  { id => "invoice_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::contract_balances

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<contract_balances>

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

=head2 cash_balance

  data_type: 'double precision'
  is_nullable: 1

=head2 cash_balance_interval

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 free_time_balance

  data_type: 'integer'
  is_nullable: 1

=head2 free_time_balance_interval

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 start

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 end

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 invoice_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contracts>

=head2 contract_credits

Type: has_many

Related object: L<NGCP::Schema::billing::Result::contract_credits>

=head2 invoice

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::invoices>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2W23l24YFniu/LhB2SlSQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
