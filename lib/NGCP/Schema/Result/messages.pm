package NGCP::Schema::Result::messages;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);

__PACKAGE__->table("sipstats.messages");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [17, 6], inflate_datetime => 'epoch_micro' },
  "protocol",
  {
    data_type => "enum",
    extra => { list => ["IPv4", "IPv6"] },
    is_nullable => 0,
  },
  "transport",
  {
    data_type => "enum",
    extra => { list => ["UDP", "TCP"] },
    is_nullable => 0,
  },
  "src_ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "dst_ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "src_port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "dst_port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "payload",
  { data_type => "blob", is_nullable => 0 },
  "method",
  {
    accessor => "column_method",
    data_type => "varchar",
    is_nullable => 0,
    size => 20,
  },
  "cseq_method",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "request_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "caller_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

__PACKAGE__->has_many(
  "message_packets",
  "NGCP::Schema::Result::message_packets",
  { "foreign.message" => "self.id" },
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

NGCP::Schema::Result::messages

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "sipstats.messages".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<sipstats.messages>

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

=head2 protocol

  data_type: 'enum'
  extra: {list => ["IPv4","IPv6"]}
  is_nullable: 0

=head2 transport

  data_type: 'enum'
  extra: {list => ["UDP","TCP"]}
  is_nullable: 0

=head2 src_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 dst_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 src_port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 dst_port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 payload

  data_type: 'blob'
  is_nullable: 0

=head2 method

  accessor: 'column_method'
  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 cseq_method

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 request_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 caller_uuid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 callee_uuid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

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
