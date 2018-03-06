package NGCP::Schema::Result::journals;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",);

__PACKAGE__->table("billing.journals");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "operation",
  {
    data_type => "enum",
    default_value => "create",
    extra => { list => ["create", "update", "delete"] },
    is_nullable => 0,
  },
  "resource_name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "resource_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "content_format",
  {
    data_type => "enum",
    default_value => "json",
    extra => { list => ["storable", "json", "json_deflate", "sereal"] },
    is_nullable => 0,
  },
  "content",
  { data_type => "longblob", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
