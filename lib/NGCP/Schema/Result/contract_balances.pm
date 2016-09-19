package NGCP::Schema::Result::contract_balances;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.contract_balances");


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
  "topup_count",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "timely_topup_count",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
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
  "underrun_profiles",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "underrun_lock",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("balance_interval", ["contract_id", "start", "end"]);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::billing_contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "contract_credits",
  "NGCP::Schema::Result::contract_credits",
  { "foreign.balance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "invoice",
  "NGCP::Schema::Result::invoices",
  { id => "invoice_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "topup_log_contract_balances_after",
  "NGCP::Schema::Result::topup_log",
  { "foreign.contract_balance_after_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "topup_log_contract_balances_before",
  "NGCP::Schema::Result::topup_log",
  { "foreign.contract_balance_before_id" => "self.id" },
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

NGCP::Schema::Result::contract_balances

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

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

=head2 topup_count

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 timely_topup_count

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
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

=head2 underrun_profiles

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 underrun_lock

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<balance_interval>

=over 4

=item * L</contract_id>

=item * L</start>

=item * L</end>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_contracts>

=head2 contract_credits

Type: has_many

Related object: L<NGCP::Schema::Result::contract_credits>

=head2 invoice

Type: belongs_to

Related object: L<NGCP::Schema::Result::invoices>

=head2 topup_log_contract_balances_after

Type: has_many

Related object: L<NGCP::Schema::Result::topup_log>

=head2 topup_log_contract_balances_before

Type: has_many

Related object: L<NGCP::Schema::Result::topup_log>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:04x1fzwpIf4dja9KlJJywg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
