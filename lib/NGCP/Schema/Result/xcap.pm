package NGCP::Schema::Result::xcap;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.xcap");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "doc",
  { data_type => "mediumblob", is_nullable => 0 },
  "doc_type",
  { data_type => "integer", is_nullable => 0 },
  "etag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "source",
  { data_type => "integer", is_nullable => 0 },
  "doc_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "port",
  { data_type => "integer", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("doc_uri_idx", ["doc_uri"]);

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

NGCP::Schema::Result::xcap

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.xcap".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.xcap>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 doc

  data_type: 'mediumblob'
  is_nullable: 0

=head2 doc_type

  data_type: 'integer'
  is_nullable: 0

=head2 etag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 source

  data_type: 'integer'
  is_nullable: 0

=head2 doc_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 port

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<doc_uri_idx>

=over 4

=item * L</doc_uri>

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
