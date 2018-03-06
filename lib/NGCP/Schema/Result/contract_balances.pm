package NGCP::Schema::Result::contract_balances;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.contract_balances");

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
  "cash_balance",
  { data_type => "double precision", is_nullable => 1 },
  "initial_cash_balance",
  { data_type => "double precision", is_nullable => 1 },
  "cash_balance_interval",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "free_time_balance",
  { data_type => "integer", is_nullable => 1 },
  "initial_free_time_balance",
  { data_type => "integer", is_nullable => 1 },
  "free_time_balance_interval",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "topup_count",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "timely_topup_count",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "invoice_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "underrun_profiles",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "underrun_lock",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "contract_credits",
  "NGCP::Schema::Result::contract_credits",
  { "foreign.balance_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "invoice",
  "NGCP::Schema::Result::invoices",
  { id => "invoice_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->has_many(
  "before_topup_log",
  "NGCP::Schema::Result::topup_logs",
  { 'foreign.contract_balance_before_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "after_topup_log",
  "NGCP::Schema::Result::topup_logs",
  { 'foreign.contract_balance_after_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::contract_balances

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.contract_balances".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.contract_balances>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 cash_balance

  data_type: 'double precision'
  is_nullable: 1

=head2 cash_balance_interval

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 free_time_balance

  data_type: 'integer'
  is_nullable: 1

=head2 free_time_balance_interval

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 start

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 end

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 invoice_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 underrun_profiles

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 underrun_lock

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::contracts>

=head2 contract_credits

Type: has_many

Related object: L<NGCP::Schema::Result::contract_credits>

=head2 invoice

Type: belongs_to

Related object: L<NGCP::Schema::Result::invoices>

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2017 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this package.  If not, see <https://www.gnu.org/licenses/>.
