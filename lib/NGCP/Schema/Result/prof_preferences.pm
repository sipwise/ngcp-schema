package NGCP::Schema::Result::prof_preferences;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.dom_preferences");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "username",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 128 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "attribute",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "last_modified",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "1900-01-01 00:00:01",
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
