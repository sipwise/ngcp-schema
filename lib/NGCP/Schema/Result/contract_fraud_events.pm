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
);

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition("
SELECT bpinfo.id, bpinfo.reseller_id, bpinfo.interval, bpinfo.type,
       IF (bpinfo.fraud_use_reseller_rates > 0, SUM(cdr.source_reseller_cost),
                                                SUM(cdr.source_customer_cost)) as interval_cost,
       bpinfo.interval_limit,
       bpinfo.interval_lock,
       bpinfo.interval_notify,
       bpinfo.fraud_use_reseller_rates as use_reseller_rates
FROM (
  SELECT c.id, n.reseller_id, bp.fraud_use_reseller_rates, i.interval,
    IF (i.interval = 'month',
        IF (cfp.fraud_interval_limit > 0,
            'account_limit', 'profile_limit'),
        IF (cfp.fraud_daily_limit > 0,
            'account_limit', 'profile_limit')
       ) AS type,
    IF (i.interval = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_limit, bp.fraud_interval_limit),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_limit, bp.fraud_daily_limit)
       ) AS interval_limit,
    IF (i.interval = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_lock, bp.fraud_interval_lock),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_lock, bp.fraud_daily_lock)
       ) AS interval_lock,
    IF (i.interval = 'month',
        IF (cfp.fraud_interval_limit > 0,
            cfp.fraud_interval_notify, bp.fraud_interval_notify),
        IF (cfp.fraud_daily_limit > 0,
            cfp.fraud_daily_notify, bp.fraud_daily_notify)
       ) AS interval_notify
  FROM (SELECT IF(? = 'month','month','day') AS 'interval') i,
       billing.contracts c
  INNER JOIN (
        SELECT m.contract_id, m.billing_profile_id, MAX(m.start_date)
        FROM billing.billing_mappings m
        WHERE (m.start_date IS NULL OR m.start_date <= NOW())
          AND (m.end_date IS NULL OR m.end_date >= NOW())
        GROUP BY 1
        ) bm ON bm.contract_id = c.id
  JOIN billing.billing_profiles bp ON bp.id = bm.billing_profile_id
  JOIN billing.contacts n ON n.id = c.contact_id
  JOIN billing.resellers r ON r.id = n.reseller_id
  LEFT JOIN billing.contract_fraud_preferences cfp ON cfp.contract_id = c.id
  WHERE c.status = 'active'
  HAVING interval_limit > 0
) as bpinfo
JOIN accounting.cdr ON cdr.source_account_id = bpinfo.id
WHERE CASE WHEN bpinfo.interval = 'month'
  THEN cdr.start_time
    BETWEEN UNIX_TIMESTAMP(DATE_FORMAT(NOW(), '%Y-%m-01 00:00:00'))
        AND UNIX_TIMESTAMP(DATE_FORMAT(NOW() + INTERVAL 1 MONTH, '%Y-%m-01 00:00:00'))-1
  ELSE cdr.start_time
    BETWEEN UNIX_TIMESTAMP(DATE_FORMAT(NOW(), '%Y-%m-%d 00:00:00'))
        AND UNIX_TIMESTAMP(DATE_FORMAT(NOW() + INTERVAL 1 DAY, '%Y-%m-%d 00:00:00'))-1
  END
GROUP BY bpinfo.id
HAVING interval_cost >= interval_limit
");

1;
