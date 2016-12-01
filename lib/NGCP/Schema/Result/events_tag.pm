package NGCP::Schema::Result::events_tag;

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
      "number_cc",
      "number_ac",
      "number_sn",
      "pilot_number_cc",
      "pilot_number_ac",
      "pilot_number_sn"
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
