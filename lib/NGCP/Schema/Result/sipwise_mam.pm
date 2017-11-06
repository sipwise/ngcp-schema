package NGCP::Schema::Result::sipwise_mam;

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

__PACKAGE__->table("prosody.sipwise_mam");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 255
  },
  "key",
  {
    data_type => "binary",
    is_nullable => 0,
    size => 16
  },
  "stanza",
  {
    data_type => "text",
    is_nullable => 1
  },
  "epoch",
  {
    data_type => "integer",
    is_nullable => 0,
  },
  "with",
  {
    data_type => "varchar",
    is_nullable => 1,
    size => 255
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
