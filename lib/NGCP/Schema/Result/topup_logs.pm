package NGCP::Schema::Result::topup_logs;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli");

__PACKAGE__->table("billing.topup_log");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },

  "username",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },

  "type",
  {
    data_type => "enum",
    extra => { list => ["cash", "voucher", "set_balance"] },
    is_nullable => 0,
  },
  "outcome",
  {
    data_type => "enum",
    extra => { list => ["ok", "failed"] },
    is_nullable => 0,
  },
  "message",
  { data_type => "varchar", is_nullable => 1, size => 255 },

  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "amount",
  { data_type => "double precision", default_value => 0, is_nullable => 1 },
  "voucher_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "cash_balance_before",
  { data_type => "double precision", default_value => 0, is_nullable => 1 },

  "cash_balance_after",
  { data_type => "double precision", default_value => 0, is_nullable => 1 },

  "package_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "package_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "profile_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "profile_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "lock_level_before",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "lock_level_after",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },

  "contract_balance_before_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "contract_balance_after_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },

  "request_token",
  { data_type => "varchar", is_nullable => 1, size => 255 },

);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { "foreign.id" => "self.subscriber_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { "foreign.id" => "self.contract_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "voucher",
  "NGCP::Schema::Result::vouchers",
  { "foreign.id" => "self.voucher_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "old_package",
  "NGCP::Schema::Result::profile_packages",
  { "foreign.id" => "self.package_before_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "new_package",
  "NGCP::Schema::Result::profile_packages",
  { "foreign.id" => "self.package_after_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "old_profile",
  "NGCP::Schema::Result::billing_profiles",
  { "foreign.id" => "self.profile_before_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "new_profile",
  "NGCP::Schema::Result::billing_profiles",
  { "foreign.id" => "self.profile_after_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "old_contract_balance",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.id" => "self.contract_balance_before_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "new_contract_balance",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.id" => "self.contract_balance_after_id" },
  { is_deferrable => 1, join_type => "LEFT", on_delete => "SET NULL", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;