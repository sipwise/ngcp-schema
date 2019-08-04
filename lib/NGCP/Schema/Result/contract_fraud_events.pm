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
  "id",
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
  "interval",
  {
    data_type => "varchar",
    size      => 64,
    is_nullable => 0,
  },
  "interval_date",
  {
    data_type => "varchar",
    size      => 10,
    is_nullable => 0,
  },
  "type",
  {
    data_type => "varchar",
    size      => 64,
    is_nullable => 0,
  },
  "interval_cost",
  {
    data_type => "decimal",
    size => [14,6],
    default_value => 0,
    is_nullable => 0,
  },
  "interval_limit",
  {
    data_type => "decimal",
    size => [14,6],
    default_value => 0,
    is_nullable => 0,
  },
  "interval_lock",
  {
    data_type => "tinyint",
    is_nullable => 1,
    extra => { unsigned => 1 },
  },
  "interval_notify",
  {
    data_type => "varchar",
    size      => 255,
    is_nullable => 1,
  },
  "use_reseller_rates",
  {
    data_type => "tinyint",
    is_nullable => 0,
    extra => { unsigned => 1 },
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

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(<<SQL);
SELECT bpinfo.id, bpinfo.reseller_id,
       bpinfo.period as `interval`, bpinfo.period_date as 'interval_date', bpinfo.type,
       IF (bpinfo.fraud_use_reseller_rates > 0, bpinfo.reseller_cost,
                                                bpinfo.customer_cost) as interval_cost,
       bpinfo.interval_limit,
       bpinfo.interval_lock,
       bpinfo.interval_notify,
       bpinfo.fraud_use_reseller_rates as use_reseller_rates,
       bpinfo.notify_status,
       bpinfo.notified_at
FROM (
  SELECT c.id, n.reseller_id, bp.fraud_use_reseller_rates,
         cpc.period, cpc.period_date,
         cpc.reseller_cost, cpc.customer_cost,
         cpc.notify_status, cpc.notified_at,
    IF (cpc.period = 'month',
        IF (cfp.fraud_interval_limit > 0,
            'account_limit', 'profile_limit'),
        IF (cfp.fraud_daily_limit > 0,
            'account_limit', 'profile_limit')
       ) AS type,
    IF (cpc.period = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_limit, bp.fraud_interval_limit),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_limit, bp.fraud_daily_limit)
       ) AS interval_limit,
    IF (cpc.period = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_lock, bp.fraud_interval_lock),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_lock, bp.fraud_daily_lock)
       ) AS interval_lock,
    IF (cpc.period = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_notify, bp.fraud_interval_notify),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_notify, bp.fraud_daily_notify)
       ) AS interval_notify
  FROM billing.contracts c
  JOIN billing.v_actual_billing_profiles bp_actual ON bp_actual.contract_id = c.id
  JOIN billing.billing_profiles bp ON bp.id = bp_actual.billing_profile_id
  JOIN billing.contacts n ON n.id = c.contact_id
  JOIN billing.resellers r ON r.id = n.reseller_id
  JOIN accounting.cdr_period_costs cpc ON cpc.contract_id = c.id
  LEFT JOIN billing.contract_fraud_preferences cfp ON cfp.contract_id = c.id
  WHERE c.status = 'active'
   AND cpc.fraud_limit_exceeded = 1
  HAVING interval_limit > 0
) AS bpinfo
HAVING interval_cost >= interval_limit
SQL

1;
