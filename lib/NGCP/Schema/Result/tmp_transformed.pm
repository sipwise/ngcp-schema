package NGCP::Schema::Result::tmp_transformed;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.tmp_transformed");

__PACKAGE__->add_columns(
  "billing_mapping_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
#    is_auto_increment => 1,
    is_nullable => 0,
  },
  "start_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "end_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "effective_start_date",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },
  "profile_id",
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
    is_nullable => 0,
  },

  "network_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "last",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

#__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "profile_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "contract_active",
  "NGCP::Schema::Result::contracts",
  sub {
    my $args = shift;
    return {
        "$args->{foreign_alias}.id" => { -ident => "$args->{self_alias}.contract_id" } ,
        "$args->{foreign_alias}.status" => { '!=' => 'terminated' },
    };
  },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "network",
  "NGCP::Schema::Result::billing_networks",
  { id => "network_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;

