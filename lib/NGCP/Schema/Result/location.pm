package NGCP::Schema::Result::location;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.location");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "contact",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "received",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "expires",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "2030-05-28 21:32:15",
    is_nullable => 0,
  },
  "q",
  {
    data_type => "float",
    default_value => "1.00",
    is_nullable => 0,
    size => [10, 2],
  },
  "callid",
  {
    data_type => "varchar",
    default_value => "Default-Call-ID",
    is_nullable => 0,
    size => 255,
  },
  "cseq",
  { data_type => "integer", default_value => 13, is_nullable => 0 },
  "last_modified",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "1900-01-01 00:00:01",
    is_nullable => 0,
  },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "cflags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "user_agent",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "socket",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "methods",
  { data_type => "integer", is_nullable => 1 },
  "ruid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "reg_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "instance",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("ruid_idx", ["ruid"]);

# handle with care, you need to join them together yourself, like:
# { 'domain.id' => { -ident => 'subscriber.domain_id' } },
# { join => [ 'subscriber', 'domain' ] }
# XXX: DEPRECATED!! DON'T USE THIS RELATION ANYMORE
__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { "foreign.username" => "self.username" },
);

__PACKAGE__->belongs_to(
  "kam_subscriber",
  "NGCP::Schema::Result::subscriber",
  {
    "foreign.username" => "self.username",
    "foreign.domain" => "self.domain",
  },
);

__PACKAGE__->belongs_to(
  "domain",
  "NGCP::Schema::Result::voip_domains",
  { "foreign.domain" => "self.domain" },
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

NGCP::Schema::Result::location

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.location".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.location>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 contact

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 received

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 expires

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '2030-05-28 21:32:15'
  is_nullable: 0

=head2 q

  data_type: 'float'
  default_value: 1.00
  is_nullable: 0
  size: [10,2]

=head2 callid

  data_type: 'varchar'
  default_value: 'Default-Call-ID'
  is_nullable: 0
  size: 255

=head2 cseq

  data_type: 'integer'
  default_value: 13
  is_nullable: 0

=head2 last_modified

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '1900-01-01 00:00:01'
  is_nullable: 0

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 cflags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 user_agent

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 socket

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 methods

  data_type: 'integer'
  is_nullable: 1

=head2 ruid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 reg_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 instance

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<ruid_idx>

=over 4

=item * L</ruid>

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
