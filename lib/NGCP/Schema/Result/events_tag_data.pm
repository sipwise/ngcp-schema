package NGCP::Schema::Result::events_tag_data;

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

__PACKAGE__->table("accounting.events_tag_data");

__PACKAGE__->add_columns(
  "event_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "tag_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "val",
  { data_type => "text", is_nullable => 0 },
  "event_timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },

);

__PACKAGE__->set_primary_key("event_id","tag_id","event_timestamp");

__PACKAGE__->has_one(
  "relation",
  'NGCP::Schema::Result::events_tag',
  { 'foreign.id' => 'self.tag_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
