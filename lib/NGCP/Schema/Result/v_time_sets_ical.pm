package NGCP::Schema::Result::v_time_sets_ical;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");


__PACKAGE__->table("provisioning.v_time_sets_ical");
__PACKAGE__->result_source_instance->view_definition("SELECT s.id, s.name, concat ( \"BEGIN:VCALENDAR\\n\", \"PRODID:-//Mozilla.org/NONSGML Mozilla Calendar V1.1//EN\\n\",IFNULL(CONCAT(\"NAME:\",s.name,\"\\n\"),''),        \"VERSION:2.0\\n\\n\",GROUP_CONCAT(p.event_ical SEPARATOR '\\n'),        \"END:VCALENDAR\\n\") AS icalFROM provisioning.voip_time_sets s LEFT JOIN v_time_periods_ical p ON s.id = p.time_set_id
GROUP BY s.id");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 90 },
  "ical",
  { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->has_many(
  "periods_ical",
  "NGCP::Schema::Result::v_time_periods_ical",
  { "foreign.id" => "self.id" },
);

__PACKAGE__->belongs_to(
  "voip_time_sets",
  "NGCP::Schema::Result::v_time_periods_ical",
  { "foreign.id" => "self.id" },
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

NGCP::Schema::Result::v_time_sets_ical - VIEW

=head1 DESCRIPTION

This module is a schema class for the NGCP database view "provisioning.v_time_sets_ical".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<v_time_sets_ical>

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 90

=head2 ical

  data_type: 'text'
  is_nullable: 1

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
