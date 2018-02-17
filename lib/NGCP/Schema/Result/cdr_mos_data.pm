package NGCP::Schema::Result::cdr_mos_data;

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

__PACKAGE__->table("accounting.cdr_mos_data");

__PACKAGE__->add_columns(
  "cdr_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 0,
    is_nullable => 0,
  },
  "mos_average",
  {
    data_type => "decimal",
    size      => [5, 1],
    is_nullable => 1,
  },
  "mos_average_packetloss",
  {
    data_type => "decimal",
    size      => [5, 1],
    is_nullable => 1,
  },
  "mos_average_jitter",
  {
    data_type => "decimal",
    size      => [5, 1],
    is_nullable => 1,
  },
  "mos_average_roundtrip",
  {
    data_type => "decimal",
    size      => [5, 1],
    is_nullable => 1,
  },
  "cdr_start_time",
  {
    data_type => "decimal",
    size      => [13, 3],
    inflate_datetime => 'epoch_milli',
    is_nullable => 0,
  }
);


__PACKAGE__->set_primary_key("cdr_id");

__PACKAGE__->belongs_to(
  "cdr",
  "NGCP::Schema::Result::cdr",
  { "id" => "cdr_id" },
  {
    join_type     => "RIGHT",
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

NGCP::Schema::Result::cdr_mos_data

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "accounting.cdr_mos_data".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<accounting.cdr>

=head1 ACCESSORS

=head2 cdr_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 0
  is_nullable: 0

=head2 mos_average

  data_type: 'decimal'
  is_nullable: 0
  size: [5,1]

=head2 mos_average_packetloss

  data_type: 'decimal'
  is_nullable: 0
  size: [5,1]

=head2 mos_average_jitter

  data_type: 'decimal'
  is_nullable: 0
  size: [5,1]

=head2 mos_average_roundtrip

  data_type: 'decimal'
  is_nullable: 0
  size: [5,1]

=head2 cdr_start_time

  data_type: 'decimal'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

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
