package NGCP::Schema::Result::package_profile_sets;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.package_profile_sets");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "package_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  #"topup_id",
  #{
  #  data_type => "integer",
  #  extra => { unsigned => 1 },
  #  is_foreign_key => 1,
  #  is_nullable => 1,
  #},
  "discriminator",
  {
    data_type => "enum",
    #default_value => "",
    extra => { list => ["initial", "underrun", "topup"] },
    is_nullable => 0,
  }, 
  "profile_id",
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
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "profile_package",
  "NGCP::Schema::Result::profile_packages",
  { id => "package_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

#__PACKAGE__->belongs_to(
#  "package_topup",
#  "NGCP::Schema::Result::package_topups",
#  { id => "package_id" },
#  { is_deferrable => 1, join_type     => "LEFT", on_delete => "CASCADE", on_update => "CASCADE" },
#);

__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "profile_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "billing_network",
  "NGCP::Schema::Result::billing_networks",
  { id => "network_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "RESTRICT", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;