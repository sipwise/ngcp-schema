package NGCP::Schema::Result::ncos_set_levels;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.ncos_set_levels");

__PACKAGE__->add_columns(
  "ncos_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 0,
    is_nullable => 0,
  },
  "ncos_level_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 0,
    is_nullable => 0,
  },
);

__PACKAGE__->add_unique_constraint("nlm_ncos_set_id_ref", ["ncos_set_id"]);
__PACKAGE__->add_unique_constraint("nlm_ncos_level_id_ref", ["ncos_level_id"]);

__PACKAGE__->belongs_to(
  "ncos_set",
  "NGCP::Schema::Result::ncos_sets",
  { id => "ncos_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "ncos_level",
  "NGCP::Schema::Result::ncos_levels",
  { id => "ncos_level_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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

NGCP::Schema::Result::ncos_set_levels

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.ncos_set_levels".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.ncos_set_levels>

=head1 ACCESSORS

=head2 ncos_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 0
  is_nullable: 0

=head2 ncos_level_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 0
  is_nullable: 0

=back

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright ©2022 by Sipwise GmbH, Austria.

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
