package NGCP::Schema::Result::subscriber_phonebook;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->table("billing.subscriber_phonebook");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "number",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shared",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("s_number_u_idx", [qw/subscriber_id number/]);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::subscriber_phonebook

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.subscriber_phonebook".

=head1 COMPONENTS LOADED

=over 4

=back

=head1 TABLE: C<billing.subscriber_phonebook>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 number

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shared

  data_type: 'tinyint'
  is_nullable: 0
  default_value: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<s_number_u_idx>

=over 4

=item * L</subscriber_id>

=item * L</number>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_subscribers>

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2018 by Sipwise GmbH, Austria.

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
