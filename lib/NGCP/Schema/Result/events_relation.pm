package NGCP::Schema::Result::events_relation;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
    "Helper::Row::ToJSON",
);

__PACKAGE__->table("accounting.events_relation");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    extra => { list => [
    'primary_number_id',
    'subscriber_profile_id',
    'subscriber_profile_set_id',
    'pilot_primary_number_id',
    'pilot_subscriber_profile_id',
    'pilot_subscriber_profile_set_id',
    ] },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("erc_type_idx", ["type"]);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
