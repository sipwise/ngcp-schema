package NGCP::Schema::Result::contract_fraud_events;

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
__PACKAGE__->table("contract_fraud_events");


__PACKAGE__->add_columns(
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "period",
  {
    data_type => "enum",
    extra => { list => ["day", "month"] },
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    extra => { list => ["contract", "billing_profile"] },
    is_nullable => 1,
  },
  "customer_cost",
  {
    data_type => "decimal",
    size => [14,6],
    default_value => 0,
    is_nullable => 0,
  },
  "reseller_cost",
  {
    data_type => "decimal",
    size => [14,6],
    default_value => 0,
    is_nullable => 0,
  },
  "notify_status",
  {
    data_type => "enum",
    default_value => "new",
    extra => { list => ["new", "notified"] },
    is_nullable => 0,
  },
  "notified_at",
  {
    data_type => "datetime",
    is_nullable => 1,
  },

);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(<<SQL);
(select
    c.id as contract_id,
    contact.reseller_id as reseller_id,
    cpc.period as period,
    cpc.fraud_limit_type as type,
    cpc.customer_cost as customer_cost,
    cpc.reseller_cost as reseller_cost,
    cpc.notified_status,
    cpc.notified_at
from
     accounting.cdr_period_costs cpc
join billing.contracts c on c.id = cpc.contract_id
join billing.contacts contact on contact.id = c.contact_id

where
    cpc.period = 'month'
and cpc.period_date = date_format(now(),'%Y-%m-01')
and cpc.direction = 'out'
and cpc.fraud_limit_exceeded = 1
and c.status = 'active')

union all

(select
    c.id as contract_id,
    contact.reseller_id as reseller_id,
    cpc.period as period,
    cpc.fraud_limit_type as type,
    cpc.customer_cost as customer_cost,
    cpc.reseller_cost as reseller_cost
    cpc.notified_status,
    cpc.notified_at
from
     accounting.cdr_period_costs cpc
join billing.contracts c on c.id = cpc.contract_id
join billing.contacts contact on contact.id = c.contact_id

where
    cpc.period = 'month'
and cpc.period_date = date_format(now(),'%Y-%m-01')
and cpc.direction = 'out'
and cpc.fraud_limit_exceeded = 1
and c.status = 'active')
SQL

1;
