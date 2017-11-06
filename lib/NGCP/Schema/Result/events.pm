package NGCP::Schema::Result::events;

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

__PACKAGE__->table("accounting.events");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "subscriber_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "reseller_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "old_status",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "new_status",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },
  "export_status",
  {
    data_type => "enum",
    default_value => "unexported",
    extra => { list => ["unexported", "ok", "failed"] },
    is_nullable => 1,
  },
  "exported_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "relation_data",
  "NGCP::Schema::Result::events_relation_data",
  { "foreign.event_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "tag_data",
  "NGCP::Schema::Result::events_tag_data",
  { "foreign.event_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
1;
