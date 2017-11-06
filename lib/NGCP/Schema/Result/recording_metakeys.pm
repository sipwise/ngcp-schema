package NGCP::Schema::Result::recording_metakeys;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "Helper::Row::ToJSON",
);

__PACKAGE__->table("provisioning.recording_metakeys");

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
  "key",
  {
    data_type => "char",
    size => 255,
    default_value => "",
    is_nullable => 0,
  },
  "value",
  {
    data_type => "char",
    size => 255,
    default_value => "",
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
