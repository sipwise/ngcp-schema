package NGCP::Schema::Result::profile_packages;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.profile_packages");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
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
    extra => { list => ["hour", "day", "week", "month"] },
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
    extra => { list => ["create", "create_tz", "1st", "1st_tz", "topup", "topup_interval"] },
    is_nullable => 0,
  },  
  
  "carry_over_mode",
  {
    data_type => "enum",
    default_value => "carry_over",
    extra => { list => ["carry_over", "carry_over_timely", "discard"] },
    is_nullable => 0,
  },  
  #"timely_carry_over_mode",
  #{
  #  data_type => "enum",
  #  default_value => "carry_over",
  #  extra => { list => ["carry_over", "discard"] },
  #  is_nullable => 0,
  #},  
  "timely_duration_unit",
  {
    data_type => "enum",
    #default_value => "day",
    extra => { list => ["hour", "day", "week", "month"] },
    is_nullable => 1,
  },
  "timely_duration_value",
  {
    data_type => "integer",
    #default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "notopup_discard_intervals",
  {
    data_type => "integer",
    #default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  
  "underrun_lock_threshold",
  { data_type => "double precision", default_value => 0, is_nullable => 1 },  
  #{
  #  data_type => "integer",
  #  #default_value => 0,
  #  extra => { unsigned => 1 },
  #  is_nullable => 1,
  #},      
  "underrun_lock_level",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },    
  "underrun_profile_threshold",
  { data_type => "double precision", default_value => 0, is_nullable => 1 },  
  #{
  #  data_type => "integer",
  #  default_value => 0,
  #  extra => { unsigned => 1 },
  #  is_nullable => 1,
  #},  

  "topup_lock_level",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },

);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("pp_resname_idx", ["reseller_id", "name"]);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { "foreign.id" => "self.reseller_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "initial_profiles",
  "NGCP::Schema::Result::package_profile_sets",
  sub {
    return _join_condition(shift,'initial');
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "underrun_profiles",
  "NGCP::Schema::Result::package_profile_sets",
  sub {
    return _join_condition(shift,'underrun');
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

#__PACKAGE__->has_many(
#  "topups",
#  "NGCP::Schema::Result::package_topups",
#  { "foreign.package_id" => "self.id" },
#  { cascade_copy => 0, cascade_delete => 0 },
#);

__PACKAGE__->has_many(
  "topup_profiles",
  "NGCP::Schema::Result::package_profile_sets",
  sub {
    return _join_condition(shift,'topup');
  },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "profiles",
  "NGCP::Schema::Result::package_profile_sets",
  { "foreign.package_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::contracts",
  { "foreign.profile_package_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "vouchers",
  "NGCP::Schema::Result::vouchers",
  { "foreign.package_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "before_topup_log",
  "NGCP::Schema::Result::topup_log",
  { 'foreign.package_before_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "after_topup_log",
  "NGCP::Schema::Result::topup_log",
  { 'foreign.package_after_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub _join_condition {
  my ($args,$discriminator) = @_;
    return { #[{
        "$args->{foreign_alias}.package_id" => { -ident => "$args->{self_alias}.id" },
        "$args->{foreign_alias}.discriminator" => { '=' => $discriminator },
    }; #,
    #! $args->{self_result_object} ? () : {
    #    "$args->{foreign_alias}.package_id" => $args->{self_result_object}->id,
    #    "$args->{foreign_alias}.discriminator"   => { '=' => $discriminator },
    #},
    #! $args->{foreign_values} ? () : {
    #    "$args->{self_alias}.id" => $args->{foreign_values}{package_id},
    #}    
    #];
}

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
