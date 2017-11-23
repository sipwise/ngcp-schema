package NGCP::Schema::Result::billing_mappings_actual;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("billing_mappings_actual");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { 'foreign.id' => 'self.contract_id' },
  { is_deferrable => 1,
    on_delete => "CASCADE",
    on_update => "CASCADE"
  },
);

__PACKAGE__->has_one(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { 'foreign.id' => 'self.id' },
  {
    is_deferrable => 1,
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(<<SQL);
SELECT bm.id, bm.contract_id
  FROM billing.billing_mappings bm
 WHERE bm.start_date <=> (SELECT MAX(bmm.start_date)
                            FROM billing.billing_mappings bmm
                           WHERE bmm.contract_id = bm.contract_id
                             AND (bmm.start_date IS NULL OR bmm.start_date <= ?)
                             AND (bmm.end_date IS NULL OR bmm.end_date >= ?))
SQL

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}


1;

