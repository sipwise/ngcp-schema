package NGCP::Schema::Result::recording_streams;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("provisioning.recording_streams");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "call",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "local_filename",
  {
    data_type => "varchar",
    size => 250,
    default_value => "",
    is_nullable => 0,
  },
  "full_filename",
  {
    data_type => "varchar",
    size => 250,
    default_value => "",
    is_nullable => 0,
  },
  "file_format",
  {
    data_type => "varchar",
    size => 10,
    default_value => "",
    is_nullable => 0,
  },
  "output_type",
  {
    data_type => "enum",
    default_value => "single",
    extra => { list => ["single", "mixed"] },
    is_nullable => 0,
  },
  "stream_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
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
  "sample_rate",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "channels",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "ssrc",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "recording_call",
  "NGCP::Schema::Result::recording_calls",
  { id => "call" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
