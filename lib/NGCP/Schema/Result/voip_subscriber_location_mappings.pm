package NGCP::Schema::Result::voip_subscriber_location_mappings;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_subscriber_location_mappings");

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
  "location",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "caller_pattern",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "callee_pattern",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mode",
  {
    data_type => "enum",
    default_value => "replace",
    extra => { list => ["add", "replace", "offline", "forward"] },
    is_nullable => 0,
  },
  "to_username",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "enabled",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_nullable => 0,
    default_value => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("subscriberid_idx", ["subscriber_id"]);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_subscriber_location_mappings

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_subscriber_location_mappings".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_subscriber_location_mappings>

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

=head2 location

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 caller_pattern

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 callee_pattern

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mode

  data_type: 'enum'
  default_value: 'replace'
  extra => { list => ['add', 'replace', 'offline'] }
  is_nullable: 0

=head2 to_username

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 enabled

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0
  default_value: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright ©2020 by Sipwise GmbH, Austria.

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
