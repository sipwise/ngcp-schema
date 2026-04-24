package NGCP::Schema::Result::voip_preferences_enum 2.007;

use v5.40;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_preferences_enum");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "preference_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "label",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "usr_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "prof_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "dom_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "peer_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "reseller_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "contract_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "contract_location_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "dev_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "devprof_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "fielddev_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "default_val",
  { data_type => "tinyint", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "preference",
  "NGCP::Schema::Result::voip_preferences",
  { id => "preference_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
