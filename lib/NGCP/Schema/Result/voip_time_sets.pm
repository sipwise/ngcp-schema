package NGCP::Schema::Result::voip_time_sets;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_time_sets");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  { data_type => "integer", is_nullable => 0 },
  "contract_id",
  { data_type => "integer", is_nullable => 1 },
  "subscriber_id",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 90 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("name_UNIQUE", ["name"]);

__PACKAGE__->has_many(
  "time_periods",
  "NGCP::Schema::Result::voip_time_periods",
  { "foreign.time_set_id" => "self.id" },
  # { cascade_copy => 0, cascade_delete => 0 }, # TODO: ??
);

__PACKAGE__->has_many(
  "voip_peer_groups",
  "NGCP::Schema::Result::voip_peer_groups",
  { "foreign.time_set_id" => "self.id" },
  # { cascade_copy => 0, cascade_delete => 0 }, # TODO: ??
);

__PACKAGE__->has_one(
  "timeset_ical",
  "NGCP::Schema::Result::v_time_sets_ical",
  { "foreign.id" => "self.id" },
  # { cascade_copy => 0, cascade_delete => 0 }, # TODO: ??
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
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

NGCP::Schema::Result::voip_time_sets

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_time_sets".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_time_sets>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  is_nullable: 1

=head2 subscriber_id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 90

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<name_UNIQUE>

=over 4

=item * L</name>

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
