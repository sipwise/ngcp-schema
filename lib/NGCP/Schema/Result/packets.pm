package NGCP::Schema::Result::packets;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("sipstats.packets");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [17, 6] },
  "src_mac",
  { data_type => "binary", is_nullable => 0, size => 6 },
  "dst_mac",
  { data_type => "binary", is_nullable => 0, size => 6 },
  "header",
  { data_type => "blob", is_nullable => 0 },
  "payload",
  { data_type => "blob", is_nullable => 0 },
  "trailer",
  { data_type => "blob", is_nullable => 0 },
);

__PACKAGE__->has_many(
  "message_packets",
  "NGCP::Schema::Result::message_packets",
  { "foreign.packet" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->set_primary_key("id");

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

NGCP::Schema::Result::packets

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "sipstats.packets".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<sipstats.packets>

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 timestamp

  data_type: 'decimal'
  is_nullable: 0
  size: [17,6]

=head2 src_mac

  data_type: 'binary'
  is_nullable: 0
  size: 6

=head2 dst_mac

  data_type: 'binary'
  is_nullable: 0
  size: 6

=head2 header

  data_type: 'blob'
  is_nullable: 0

=head2 payload

  data_type: 'blob'
  is_nullable: 0

=head2 trailer

  data_type: 'blob'
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
