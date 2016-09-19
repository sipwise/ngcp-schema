package NGCP::Schema::Result::topup_log;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.topup_log");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "type",
  {
    data_type => "enum",
    extra => { list => ["cash", "voucher"] },
    is_nullable => 0,
  },
  "outcome",
  {
    data_type => "enum",
    extra => { list => ["ok", "failed"] },
    is_nullable => 0,
  },
  "message",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "amount",
  { data_type => "double precision", is_nullable => 1 },
  "voucher_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "cash_balance_before",
  { data_type => "double precision", is_nullable => 1 },
  "cash_balance_after",
  { data_type => "double precision", is_nullable => 1 },
  "package_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "package_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "profile_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "profile_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "lock_level_before",
  { data_type => "tinyint", is_nullable => 1 },
  "lock_level_after",
  { data_type => "tinyint", is_nullable => 1 },
  "contract_balance_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "contract_balance_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "request_token",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::billing_contracts",
  { id => "contract_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "contract_balance_after",
  "NGCP::Schema::Result::contract_balances",
  { id => "contract_balance_after_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "contract_balance_before",
  "NGCP::Schema::Result::contract_balances",
  { id => "contract_balance_before_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "package_after",
  "NGCP::Schema::Result::profile_packages",
  { id => "package_after_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "package_before",
  "NGCP::Schema::Result::profile_packages",
  { id => "package_before_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "profile_after",
  "NGCP::Schema::Result::billing_profiles",
  { id => "profile_after_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "profile_before",
  "NGCP::Schema::Result::billing_profiles",
  { id => "profile_before_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::billing_voip_subscribers",
  { id => "subscriber_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "voucher",
  "NGCP::Schema::Result::vouchers",
  { id => "voucher_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::topup_log

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<topup_log>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 timestamp

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 type

  data_type: 'enum'
  extra: {list => ["cash","voucher"]}
  is_nullable: 0

=head2 outcome

  data_type: 'enum'
  extra: {list => ["ok","failed"]}
  is_nullable: 0

=head2 message

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 amount

  data_type: 'double precision'
  is_nullable: 1

=head2 voucher_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 cash_balance_before

  data_type: 'double precision'
  is_nullable: 1

=head2 cash_balance_after

  data_type: 'double precision'
  is_nullable: 1

=head2 package_before_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 package_after_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 profile_before_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 profile_after_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 lock_level_before

  data_type: 'tinyint'
  is_nullable: 1

=head2 lock_level_after

  data_type: 'tinyint'
  is_nullable: 1

=head2 contract_balance_before_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 contract_balance_after_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 request_token

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_contracts>

=head2 contract_balance_after

Type: belongs_to

Related object: L<NGCP::Schema::Result::contract_balances>

=head2 contract_balance_before

Type: belongs_to

Related object: L<NGCP::Schema::Result::contract_balances>

=head2 package_after

Type: belongs_to

Related object: L<NGCP::Schema::Result::profile_packages>

=head2 package_before

Type: belongs_to

Related object: L<NGCP::Schema::Result::profile_packages>

=head2 profile_after

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 profile_before

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_voip_subscribers>

=head2 voucher

Type: belongs_to

Related object: L<NGCP::Schema::Result::vouchers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0EMfBOr+kE9CF0rax6pjFQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
