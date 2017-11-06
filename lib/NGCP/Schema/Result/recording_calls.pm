package NGCP::Schema::Result::recording_calls;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("provisioning.recording_calls");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "call_id",
  {
    data_type => "varchar",
    size => 250,
    default_value => "",
    is_nullable => 0,
  },
  "start_timestamp",
  {
    data_type => "decimal",
    is_nullable => 0,
    size => [13, 3],
    inflate_datetime => 'epoch_milli'
  },
  "end_timestamp",
  {
    data_type => "decimal",
    is_nullable => 0,
    size => [13, 3],
    inflate_datetime => 'epoch_milli'
  },
  "status",
  {
    data_type => "enum",
    default_value => "recording",
    extra => { list => ["recording", "completed", "confirmed"] },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "recording_streams",
  "NGCP::Schema::Result::recording_streams",
  { "foreign.call" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "recording_metakeys",
  "NGCP::Schema::Result::recording_metakeys",
  { "foreign.call" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
