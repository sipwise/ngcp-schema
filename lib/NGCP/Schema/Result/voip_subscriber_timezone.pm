package NGCP::Schema::Result::voip_subscriber_timezone;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);

__PACKAGE__->table("billing.v_subscriber_timezone");

__PACKAGE__->add_columns(
  "contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "uuid",
  {
    data_type => "char",
    size => 36,
    is_nullable => 0,
  },
  "name",
  {
    data_type => "varchar",
    size      => 80,
    is_nullable => 1,
  },
);

__PACKAGE__->belongs_to(
  "voip_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { id => "subscriber_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contact",
  "NGCP::Schema::Result::contacts",
  { id => "contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;

