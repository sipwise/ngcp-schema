package NGCP::Schema::Result::voip_sound_sets;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_sound_sets");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "contract_default",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "voip_sound_files",
  "NGCP::Schema::Result::voip_sound_files",
  { "foreign.set_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { 'foreign.id' => 'self.contract_id' },
  { 'join_type' => 'left', is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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

NGCP::Schema::Result::voip_sound_sets

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_sound_sets".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_sound_sets>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 voip_sound_files

Type: has_many

Related object: L<NGCP::Schema::Result::voip_sound_files>

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
