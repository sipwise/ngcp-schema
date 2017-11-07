package NGCP::Schema::Result::uid_credentials;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.uid_credentials");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "auth_username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "did",
  {
    data_type => "varchar",
    default_value => "_default",
    is_nullable => 0,
    size => 64,
  },
  "realm",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 28 },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ha1",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "ha1b",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "uid",
  { data_type => "varchar", is_nullable => 0, size => 64 },
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

NGCP::Schema::Result::uid_credentials

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.uid_credentials".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.uid_credentials>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 auth_username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 did

  data_type: 'varchar'
  default_value: '_default'
  is_nullable: 0
  size: 64

=head2 realm

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 28

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ha1

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 ha1b

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 uid

  data_type: 'varchar'
  is_nullable: 0
  size: 64

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
