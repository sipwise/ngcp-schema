package NGCP::Schema::Result::dialog;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.dialog");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "hash_entry",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hash_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "callid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "caller_cseq",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "callee_cseq",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "caller_route_set",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "callee_route_set",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "caller_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "callee_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "caller_sock",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "callee_sock",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "state",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "start_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "timeout",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "sflags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "toroute_name",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "req_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "iflags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "xdata",
  { data_type => "varchar", is_nullable => 1, size => 512 },
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

NGCP::Schema::Result::dialog

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.dialog".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.dialog>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 hash_entry

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hash_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 caller_cseq

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 callee_cseq

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 caller_route_set

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 callee_route_set

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 caller_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 callee_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 caller_sock

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 callee_sock

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 state

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 start_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 timeout

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sflags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 toroute_name

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 req_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 iflags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 xdata

  data_type: 'varchar'
  is_nullable: 1
  size: 512

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
