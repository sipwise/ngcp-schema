package NGCP::Schema::Result::cdr;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("accounting.cdr");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "update_time",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "source_user_id",
  { data_type => "char", is_nullable => 0, size => 36 },
  "source_provider_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_external_subscriber_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_external_contract_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_account_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "source_user",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_cli",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "source_clir",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "source_ip",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "source_gpp0",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp1",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp2",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp3",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp4",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp5",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp6",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp7",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp8",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_gpp9",
  { data_type => "varchar", is_nullable => 1, size => 255 },

  "source_lnp_prefix",
  { data_type => "varchar", is_nullable => 0, size => 255, default_value => "" },
  "source_user_out",
  { data_type => "varchar", is_nullable => 0, size => 255, default_value => "" },

  "destination_user_id",
  { data_type => "char", is_nullable => 0, size => 36 },
  "destination_provider_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_external_subscriber_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_external_contract_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_account_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "destination_user",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_user_dialed",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_user_in",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_domain_in",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_gpp0",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp1",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp2",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp3",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp4",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp5",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp6",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp7",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp8",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_gpp9",
  { data_type => "varchar", is_nullable => 1, size => 255 },

  "destination_lnp_prefix",
  { data_type => "varchar", is_nullable => 0, size => 255, default_value => "" },
  "destination_user_out",
  { data_type => "varchar", is_nullable => 0, size => 255, default_value => "" },

  "peer_auth_user",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "peer_auth_realm",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "call_type",
  {
    data_type => "enum",
    default_value => "call",
    extra => { list => ["call", "cfu", "cft", "cfb", "cfna", "sms", "cfs", "cfr"] },
    is_nullable => 0,
  },
  "call_status",
  {
    data_type => "enum",
    default_value => "ok",
    extra => {
      list => ["ok", "busy", "noanswer", "cancel", "offline", "timeout", "other"],
    },
    is_nullable => 0,
  },
  "call_code",
  { data_type => "char", is_nullable => 0, size => 3 },
  "init_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },
  "start_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' },
  "duration",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_carrier_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "source_reseller_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "source_customer_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "source_carrier_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_carrier_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_carrier_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "destination_reseller_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "destination_customer_cost",
  { data_type => "decimal", is_nullable => 1, size => [14, 6] },
  "destination_carrier_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "frag_carrier_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "frag_reseller_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "frag_customer_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "is_fragmented",
  { data_type => "tinyint", is_nullable => 1 },
  "split",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rated_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "rating_status",
  {
    data_type => "enum",
    default_value => "unrated",
    extra => { list => ["unrated", "ok", "failed"] },
    is_nullable => 0,
  },
  "exported_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "export_status",
  {
    data_type => "enum",
    default_value => "unexported",
    extra => { list => ["unexported", "ok", "failed"] },
    is_nullable => 0,
  },
  "source_lnp_type",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_lnp_type",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "source_customer_billing_zones_history",
  "NGCP::Schema::Result::billing_zones_history",
  { "id" => "source_customer_billing_zone_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->belongs_to(
  "destination_customer_billing_zones_history",
  "NGCP::Schema::Result::billing_zones_history",
  { "id" => "destination_customer_billing_zone_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->belongs_to(
  "source_account",
  "NGCP::Schema::Result::contracts",
  { "id" => "source_account_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "UPDATE",
  },
);

__PACKAGE__->belongs_to(
  "source_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { uuid => "source_user_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => 'left' }
);

__PACKAGE__->belongs_to(
  "destination_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { uuid => "destination_user_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => 'left' }
);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  sub {
    my $args = shift;
    return { -or => [
      "$args->{foreign_alias}.uuid" => { -ident => "$args->{self_alias}.destination_user_id" },
      "$args->{foreign_alias}.uuid" => { -ident => "$args->{self_alias}.source_user_id" },
    ]};
  },
  { cascade_copy => 0, cascade_delete => 0, join_type => 'left' }
);


__PACKAGE__->might_have(
  "cdr_mos_data",
  'NGCP::Schema::Result::cdr_mos_data',
  { 'foreign.cdr_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 1 },
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

NGCP::Schema::Result::cdr

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "accounting.cdr".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<accounting.cdr>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 update_time

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 source_user_id

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 source_provider_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_external_subscriber_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 source_external_contract_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 source_account_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 source_user

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_cli

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 source_clir

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 source_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 destination_user_id

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 destination_provider_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_external_subscriber_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 destination_external_contract_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 destination_account_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 destination_user

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_user_dialed

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_user_in

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_domain_in

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 peer_auth_user

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 peer_auth_realm

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 call_type

  data_type: 'enum'
  default_value: 'call'
  extra: {list => ["call","cfu","cft","cfb","cfna", "sms", "cfs", "cfr"]}
  is_nullable: 0

=head2 call_status

  data_type: 'enum'
  default_value: 'ok'
  extra: {list => ["ok","busy","noanswer","cancel","offline","timeout","other"]}
  is_nullable: 0

=head2 call_code

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 init_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 start_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 duration

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_carrier_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_reseller_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_customer_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_carrier_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_carrier_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_carrier_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_reseller_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_customer_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_carrier_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 frag_carrier_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 frag_reseller_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 frag_customer_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 is_fragmented

  data_type: 'tinyint'
  is_nullable: 1

=head2 split

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rated_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 rating_status

  data_type: 'enum'
  default_value: 'unrated'
  extra: {list => ["unrated","ok","failed"]}
  is_nullable: 0

=head2 exported_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 export_status

  data_type: 'enum'
  default_value: 'unexported'
  extra: {list => ["unexported","ok","failed"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

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
