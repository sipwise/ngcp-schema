package NGCP::Schema::Result::events_tag;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
);

__PACKAGE__->table("accounting.events_tag");

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
    'primary_number_cc',
    'primary_number_ac',
    'primary_number_sn',
    'pilot_primary_number_cc',
    'pilot_primary_number_ac',
    'pilot_primary_number_sn',
    'subscriber_profile_name',
    'subscriber_profile_set_name',
    'pilot_subscriber_profile_name',
    'pilot_subscriber_profile_set_name',
    'first_non_primary_alias_username_before',
    'first_non_primary_alias_username_after',
    'pilot_first_non_primary_alias_username_before',
    'pilot_first_non_primary_alias_username_after',
    'non_primary_alias_username',
    'primary_alias_username_before',
    'primary_alias_username_after',
    'pilot_primary_alias_username_before',
    'pilot_primary_alias_username_after',
    ] },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("etc_type_idx", ["type"]);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
