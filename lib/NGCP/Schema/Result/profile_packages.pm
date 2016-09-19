package NGCP::Schema::Result::profile_packages;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.profile_packages");


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
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "initial_balance",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "service_charge",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "balance_interval_unit",
  {
    data_type => "enum",
    default_value => "month",
    extra => { list => ["minute", "hour", "day", "week", "month"] },
    is_nullable => 0,
  },
  "balance_interval_value",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "balance_interval_start_mode",
  {
    data_type => "enum",
    default_value => "1st",
    extra => { list => ["create", "1st", "topup", "topup_interval"] },
    is_nullable => 0,
  },
  "carry_over_mode",
  {
    data_type => "enum",
    default_value => "carry_over",
    extra => { list => ["carry_over", "carry_over_timely", "discard"] },
    is_nullable => 0,
  },
  "timely_duration_unit",
  {
    data_type => "enum",
    extra => { list => ["minute", "hour", "day", "week", "month"] },
    is_nullable => 1,
  },
  "timely_duration_value",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "notopup_discard_intervals",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "underrun_lock_threshold",
  { data_type => "double precision", is_nullable => 1 },
  "underrun_lock_level",
  { data_type => "tinyint", is_nullable => 1 },
  "underrun_profile_threshold",
  { data_type => "double precision", is_nullable => 1 },
  "topup_lock_level",
  { data_type => "tinyint", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("pp_resname_idx", ["reseller_id", "name"]);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::billing_contracts",
  { "foreign.profile_package_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "package_profile_sets",
  "NGCP::Schema::Result::package_profile_sets",
  { "foreign.package_id" => "self.id" },
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
  "topup_log_packages_after",
  "NGCP::Schema::Result::topup_log",
  { "foreign.package_after_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "topup_log_packages_before",
  "NGCP::Schema::Result::topup_log",
  { "foreign.package_before_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "vouchers",
  "NGCP::Schema::Result::vouchers",
  { "foreign.package_id" => "self.id" },
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

NGCP::Schema::Result::profile_packages

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<profile_packages>

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

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 initial_balance

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 service_charge

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 balance_interval_unit

  data_type: 'enum'
  default_value: 'month'
  extra: {list => ["minute","hour","day","week","month"]}
  is_nullable: 0

=head2 balance_interval_value

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 balance_interval_start_mode

  data_type: 'enum'
  default_value: '1st'
  extra: {list => ["create","1st","topup","topup_interval"]}
  is_nullable: 0

=head2 carry_over_mode

  data_type: 'enum'
  default_value: 'carry_over'
  extra: {list => ["carry_over","carry_over_timely","discard"]}
  is_nullable: 0

=head2 timely_duration_unit

  data_type: 'enum'
  extra: {list => ["minute","hour","day","week","month"]}
  is_nullable: 1

=head2 timely_duration_value

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 notopup_discard_intervals

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 underrun_lock_threshold

  data_type: 'double precision'
  is_nullable: 1

=head2 underrun_lock_level

  data_type: 'tinyint'
  is_nullable: 1

=head2 underrun_profile_threshold

  data_type: 'double precision'
  is_nullable: 1

=head2 topup_lock_level

  data_type: 'tinyint'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<pp_resname_idx>

=over 4

=item * L</reseller_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::Result::billing_contracts>

=head2 package_profile_sets

Type: has_many

Related object: L<NGCP::Schema::Result::package_profile_sets>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=head2 topup_log_packages_after

Type: has_many

Related object: L<NGCP::Schema::Result::topup_log>

=head2 topup_log_packages_before

Type: has_many

Related object: L<NGCP::Schema::Result::topup_log>

=head2 vouchers

Type: has_many

Related object: L<NGCP::Schema::Result::vouchers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ncRyUTo3GoGhPO5VqJvRfw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
