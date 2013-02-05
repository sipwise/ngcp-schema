package NGCP::Schema::billing::Result::contract_credits;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("contract_credits");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "balance_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "state",
  {
    data_type => "enum",
    default_value => "init",
    extra => { list => ["init", "transact", "charged", "failed", "success"] },
    is_nullable => 0,
  },
  "amount",
  { data_type => "double precision", is_nullable => 1 },
  "reason",
  { data_type => "text", is_nullable => 1 },
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


__PACKAGE__->belongs_to(
  "balance",
  "NGCP::Schema::billing::Result::contract_balances",
  { id => "balance_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "credit_payments",
  "NGCP::Schema::billing::Result::credit_payments",
  { "foreign.credit_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::contract_credits

=head1 TABLE: C<contract_credits>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 balance_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 state

  data_type: 'enum'
  default_value: 'init'
  extra: {list => ["init","transact","charged","failed","success"]}
  is_nullable: 0

=head2 amount

  data_type: 'double precision'
  is_nullable: 1

=head2 reason

  data_type: 'text'
  is_nullable: 1

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

=head1 RELATIONS

=head2 balance

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contract_balances>

=head2 credit_payments

Type: has_many

Related object: L<NGCP::Schema::billing::Result::credit_payments>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A7H9vSKNF5ouZlB6GlTkYg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
