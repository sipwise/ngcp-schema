package NGCP::Schema::Result::billing_profiles;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.billing_profiles");

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
  "handle",
  { data_type => "varchar", is_nullable => 0, size => 63 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "prepaid",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "interval_charge",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "interval_free_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "interval_free_cash",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "interval_unit",
  {
    data_type => "enum",
    default_value => "month",
    extra => { list => ["week", "month"] },
    is_nullable => 0,
  },
  "interval_count",
  {
    data_type => "tinyint",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "fraud_interval_limit",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_interval_lock",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_interval_notify",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "fraud_daily_limit",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_daily_lock",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_daily_notify",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "fraud_use_reseller_rates",
  {
    data_type => "tinyint", default_value => 1, is_nullable => 0,
    extra => { unsigned => 1 },
  },
  "currency",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "terminated"] },
    is_nullable => 0,
  },
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
  "terminate_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("reshand_idx", ["reseller_id", "handle"]);

__PACKAGE__->add_unique_constraint("resnam_idx", ["reseller_id", "name"]);

__PACKAGE__->has_many(
  "billing_fees",
  "NGCP::Schema::Result::billing_fees",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
__PACKAGE__->has_many(
  "billing_fees_raw",
  "NGCP::Schema::Result::billing_fees_raw",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_peaktime_specials",
  "NGCP::Schema::Result::billing_peaktime_special",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_peaktime_weekdays",
  "NGCP::Schema::Result::billing_peaktime_weekdays",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "billing_zones",
  "NGCP::Schema::Result::billing_zones",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "products",
  "NGCP::Schema::Result::products",
  { "foreign.billing_profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->has_many(
  "profile_packages",
  "NGCP::Schema::Result::profile_packages",
  { "foreign.profile_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "before_topup_log",
  "NGCP::Schema::Result::topup_logs",
  { 'foreign.profile_before_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "after_topup_log",
  "NGCP::Schema::Result::topup_logs",
  { 'foreign.profile_after_id' => 'self.id' },
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

NGCP::Schema::Result::billing_profiles

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.billing_profiles>

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

=head2 handle

  data_type: 'varchar'
  is_nullable: 0
  size: 63

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 prepaid

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 interval_charge

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 interval_free_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 interval_free_cash

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 interval_unit

  data_type: 'enum'
  default_value: 'month'
  extra: {list => ["week","month"]}
  is_nullable: 0

=head2 interval_count

  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 fraud_interval_limit

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_interval_lock

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_interval_notify

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 fraud_daily_limit

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_daily_lock

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_daily_notify

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 fraud_use_reseller_rates

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 currency

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 vat_rate

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 vat_included

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["pending","active","locked","terminated"]}
  is_nullable: 0

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

=head2 terminate_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reshand_idx>

=over 4

=item * L</reseller_id>

=item * L</handle>

=back

=head2 C<resnam_idx>

=over 4

=item * L</reseller_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 billing_fees

Type: has_many

Related object: L<NGCP::Schema::Result::billing_fees>

=head2 billing_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::billing_mappings>

=head2 billing_peaktime_specials

Type: has_many

Related object: L<NGCP::Schema::Result::billing_peaktime_special>

=head2 billing_peaktime_weekdays

Type: has_many

Related object: L<NGCP::Schema::Result::billing_peaktime_weekdays>

=head2 billing_zones

Type: has_many

Related object: L<NGCP::Schema::Result::billing_zones>

=head2 products

Type: has_many

Related object: L<NGCP::Schema::Result::products>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>
