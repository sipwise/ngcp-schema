package NGCP::Schema::Result::contracts_billing_profile_network_schedule;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.contracts_billing_profile_network_schedule");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "profile_network_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "effective_start_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },

);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->might_have(
  "profile_network",
  "NGCP::Schema::Result::contracts_billing_profile_network",
  { "foreign.id" => "self.profile_network_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
