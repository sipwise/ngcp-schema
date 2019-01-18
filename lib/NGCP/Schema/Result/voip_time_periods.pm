package NGCP::Schema::Result::voip_time_periods;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_time_periods");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "time_set_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "start",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "end",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "freq",
  {
    data_type => "enum",
    extra => {
      list => [
        "secondly",
        "minutely",
        "hourly",
        "daily",
        "weekly",
        "monthly",
        "yearly",
      ],
    },
    is_nullable => 1,
  },
  "until",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "count",
  { data_type => "integer", is_nullable => 1 },
  "interval",
  { data_type => "integer", is_nullable => 1 },
  "bysecond",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "byminute",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "byhour",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "byday",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "bymonthday",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "byyearday",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "byweekno",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "bymonth",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "bysetpos",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "comment",
  { data_type => "text", is_nullable => 1 },
  "duration",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "wkst",
  { data_type => "varchar", is_nullable => 1, size => 2 },
);


__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "time_set",
  "NGCP::Schema::Result::voip_time_sets",
  { id => "time_set_id" },
);

__PACKAGE__->has_one(
  "periods_ical",
  "NGCP::Schema::Result::v_time_periods_ical",
  { "foreign.id" => "self.id" },
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

NGCP::Schema::Result::voip_time_periods

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_time_periods".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_time_periods>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 time_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 start

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 end

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 freq

  data_type: 'enum'
  extra: {list => ["secondly","minutely","hourly","daily","weekly","monthly","yearly"]}
  is_nullable: 1

=head2 until

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 count

  data_type: 'integer'
  is_nullable: 1

=head2 interval

  data_type: 'integer'
  is_nullable: 1

=head2 bysecond

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 byminute

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 byhour

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 byday

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 bymonthday

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 byyearday

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 byweekno

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 bymonth

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 bysetpos

  data_type: 'integer'
  is_nullable: 1

=head2 comment

  data_type: 'text'
  is_nullable: 1

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
