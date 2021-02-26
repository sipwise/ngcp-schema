package NGCP::Schema::Result::billing_fees;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.billing_fees");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "billing_profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "billing_zone_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "source",
  { data_type => "varchar", default_value => ".", is_nullable => 0, size => 255 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "direction",
  {
    data_type => "enum",
    default_value => "out",
    extra => { list => ["in", "out"] },
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    default_value => "call",
    extra => { list => ["call", "sms"] },
    is_nullable => 0,
  },
  "onpeak_init_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "onpeak_init_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "onpeak_follow_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "onpeak_follow_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "offpeak_init_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "offpeak_init_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "offpeak_follow_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "offpeak_follow_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "onpeak_use_free_time",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "match_mode",
  {
    data_type => "enum",
    default_value => "regex_longest_pattern",
    extra => { list => [ "regex_longest_pattern", "regex_longest_match", "prefix", "exact_destination", ] },
    is_nullable => 0,
  },
  "onpeak_extra_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "onpeak_extra_second",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "offpeak_extra_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "offpeak_extra_second",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "offpeak_use_free_time",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "aoc_pulse_amount_per_message",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },  
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "billing_fees_histories",
  "NGCP::Schema::Result::billing_fees_history",
  { "foreign.bf_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "billing_profile_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "billing_zone",
  "NGCP::Schema::Result::billing_zones",
  { id => "billing_zone_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
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

NGCP::Schema::Result::billing_fees

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.billing_fees".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.billing_fees>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source

  data_type: 'varchar'
  default_value: '.'
  is_nullable: 0
  size: 255

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 direction

  data_type: 'enum'
  default_value: 'out'
  extra: {list => ["in","out"]}
  is_nullable: 0

=head2 type

  data_type: 'enum'
  default_value: 'call'
  extra: {list => ["call","sms"]}
  is_nullable: 0

=head2 onpeak_init_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 onpeak_init_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 onpeak_follow_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 onpeak_follow_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 offpeak_init_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 offpeak_init_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 offpeak_follow_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 offpeak_follow_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 use_free_time

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 billing_fees_histories

Type: has_many

Related object: L<NGCP::Schema::Result::billing_fees_history>

=head2 billing_profile

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 billing_zone

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_zones>

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
