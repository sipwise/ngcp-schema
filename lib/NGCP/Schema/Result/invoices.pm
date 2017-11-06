package NGCP::Schema::Result::invoices;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.invoices");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "serial",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "period_start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "period_end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "amount_net",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "amount_vat",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "amount_total",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "data",
  { data_type => "mediumblob", is_nullable => 1 },
  "sent_date",
  { data_type => "datetime", is_nullable => 1, datetime_undef_if_invalid => 1, },
  
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("serial_idx", ["serial"]);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "contract_balances",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.contract_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
