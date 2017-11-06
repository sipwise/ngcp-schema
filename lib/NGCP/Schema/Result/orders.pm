package NGCP::Schema::Result::orders;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.orders");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "customer_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "delivery_contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "type",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "state",
  {
    data_type => "enum",
    default_value => "init",
    extra => { list => ["init", "transact", "failed", "success"] },
    is_nullable => 0,
  },
  "value",
  { data_type => "integer", is_nullable => 1 },
  "shipping_costs",
  { data_type => "integer", is_nullable => 1 },
  "invoice_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "complete_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::contracts",
  { "foreign.order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "customer",
  "NGCP::Schema::Result::customers",
  { id => "customer_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "delivery_contact",
  "NGCP::Schema::Result::contacts",
  { id => "delivery_contact_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "invoice",
  "NGCP::Schema::Result::invoices",
  { id => "invoice_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->has_many(
  "order_payments",
  "NGCP::Schema::Result::order_payments",
  { "foreign.order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
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

NGCP::Schema::Result::orders

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.orders".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.orders>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 customer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 delivery_contact_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 state

  data_type: 'enum'
  default_value: 'init'
  extra: {list => ["init","transact","failed","success"]}
  is_nullable: 0

=head2 value

  data_type: 'integer'
  is_nullable: 1

=head2 shipping_costs

  data_type: 'integer'
  is_nullable: 1

=head2 invoice_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 complete_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::Result::contracts>

=head2 customer

Type: belongs_to

Related object: L<NGCP::Schema::Result::customers>

=head2 delivery_contact

Type: belongs_to

Related object: L<NGCP::Schema::Result::contacts>

=head2 invoice

Type: belongs_to

Related object: L<NGCP::Schema::Result::invoices>

=head2 order_payments

Type: has_many

Related object: L<NGCP::Schema::Result::order_payments>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

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
