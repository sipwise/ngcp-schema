package NGCP::Schema::Result::silo;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.silo");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "src_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "dst_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "inc_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "exp_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "snd_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ctype",
  {
    data_type => "varchar",
    default_value => "text/plain",
    is_nullable => 0,
    size => 32,
  },
  "body",
  { data_type => "blob", is_nullable => 0 },
  "extra_hdrs",
  { data_type => "text", is_nullable => 0 },
  "callid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "status",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
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

NGCP::Schema::Result::silo

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.silo>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 src_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 dst_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 inc_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 exp_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 snd_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ctype

  data_type: 'varchar'
  default_value: 'text/plain'
  is_nullable: 0
  size: 32

=head2 body

  data_type: 'blob'
  is_nullable: 0

=head2 extra_hdrs

  data_type: 'text'
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 status

  data_type: 'integer'
  default_value: 0
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
