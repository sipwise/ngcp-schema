package NGCP::Schema::Result::billing_mappings_actual;
use Scalar::Util qw(blessed);
use base qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("billing_mappings_actual");


__PACKAGE__->add_columns(
  "actual_bm_id",
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
);
__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { "foreign.id" => "self.actual_bm_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->set_primary_key("actual_bm_id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(<<SQL);
SELECT bm.contract_id,max(bm.id) AS actual_bm_id FROM billing.billing_mappings bm
INNER JOIN (
    SELECT bmm.contract_id, MAX(bmm.start_date) max_start_date
    FROM billing.billing_mappings bmm
    WHERE ( bmm.`end_date` >= ? OR bmm.`end_date` IS NULL )
        AND ( bmm.`start_date` <= ? OR bmm.`start_date` IS NULL )
        AND ( ? IS NULL OR bmm.`contract_id` = ? )
    GROUP BY bmm.contract_id
) bmm ON bm.contract_id=bmm.contract_id
    AND (bm.start_date=bmm.max_start_date
        OR (bmm.max_start_date IS NULL AND bm.start_date is null))
GROUP BY bm.contract_id
SQL

#__PACKAGE__->result_source_instance->view_definition("select bma.contract_id, bma.id as actual_bm_id
#from billing.billing_mappings bma
#where bma.id = (select bm.id from billing.billing_mappings bm where 
#( bm.`end_date` >= now() or bm.`end_date` IS NULL ) 
#and ( bm.`start_date` <= now() or bm.`start_date` IS NULL ) 
#and bm.contract_id = bma.contract_id
#order by bm.start_date desc, bm.id desc limit 1)
#");

1;

