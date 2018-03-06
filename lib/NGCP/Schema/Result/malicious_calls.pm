package NGCP::Schema::Result::malicious_calls;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ",
                             "Helper::Row::ToJSON",
                             "+NGCP::Schema::InflateColumn::DateTime::EpochMilli");

__PACKAGE__->table("accounting.malicious_calls");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "callee_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "caller",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "start_time",
  { data_type => "decimal", is_nullable => 0, size => [13,3], inflate_datetime => 'epoch_milli' },
  "duration",
  { data_type => "decimal", is_nullable => 0, size => [13,3] },
  "source",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "reported_at",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("mcid_callid_idx", ["call_id"]);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { uuid => "callee_uuid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
