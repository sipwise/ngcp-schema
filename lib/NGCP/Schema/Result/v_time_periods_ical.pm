package NGCP::Schema::Result::v_time_periods_ical;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");



__PACKAGE__->table("provisioning.v_time_periods_ical");
__PACKAGE__->result_source_instance->view_definition("SELECT p.`id`, p.`time_set_id`, p.`start`, p.`end`, p.`comment`,concat(\"DTSTART:\",DATE_FORMAT(p.start,'%Y%m%dT%H%i%s'),\"\\n\",\"RRULE:\",\"FREQ=\",p.freq,IFNULL(CONCAT(\";COUNT=\",     p.`count`),''),IFNULL(CONCAT(\";UNTIL=\",     DATE_FORMAT(p.until,'%Y%m%dT%H%i%s')),''),    IFNULL(CONCAT(\";INTERVAL=\",p.`interval`),''),    IFNULL(CONCAT(\";BYSECOND=\",p.bysecond),''),    IFNULL(CONCAT(\";BYMINUTE=\",p.byminute),''),    IFNULL(CONCAT(\";BYHOUR=\",p.byhour),''),    IFNULL(CONCAT(\";BYDAY=\",p.byday),''),    IFNULL(CONCAT(\";BYMONTHDAY=\",p.bymonthday),''),    IFNULL(CONCAT(\";BYYEARDAY=\",p.byyearday),''),    IFNULL(CONCAT(\";BYWEEKNO=\",p.byweekno),''),    IFNULL(CONCAT(\";BYMONTH=\",p.bymonth),''),    IFNULL(CONCAT(\";BYSETPOS=\",p.bysetpos),''),    IFNULL(CONCAT(\";WKST=\",p.wkst),'')) AS rrule_ical,concat(    \"BEGIN:VEVENT\\n\",    \"UID:\",\"sipwise\",p.id,\"\@sipwise\",s.id,\"\\n\",    \"SUMMARY:\",s.name,\" event \",p.id,\"\\n\",    \"DTSTART:\",DATE_FORMAT(p.start,'%Y%m%dT%H%i%s'),\"\\n\",    IF(year(p.end) !=\"0000\",CONCAT(\"DTEND:\",DATE_FORMAT(p.end,'%Y%m%dT%H%i%s'),\"\\n\"),\"\"),IFNULL(CONCAT(\"DURATION:\",p.`duration`,\"\\n\"),''),    \"RRULE:\",\"FREQ=\",p.freq,IFNULL(CONCAT(\";COUNT=\",     p.`count`),''),IFNULL(CONCAT(\";UNTIL=\",     DATE_FORMAT(p.until,'%Y%m%dT%H%i%s')),''),        IFNULL(CONCAT(\";INTERVAL=\",p.`interval`),''),        IFNULL(CONCAT(\";BYSECOND=\",p.bysecond),''),        IFNULL(CONCAT(\";BYMINUTE=\",p.byminute),''),        IFNULL(CONCAT(\";BYHOUR=\",p.byhour),''),        IFNULL(CONCAT(\";BYDAY=\",p.byday),''),        IFNULL(CONCAT(\";BYMONTHDAY=\",p.bymonthday),''),        IFNULL(CONCAT(\";BYYEARDAY=\",p.byyearday),''),        IFNULL(CONCAT(\";BYWEEKNO=\",p.byweekno),''),        IFNULL(CONCAT(\";BYMONTH=\",p.bymonth),''),        IFNULL(CONCAT(\";BYSETPOS=\",p.bysetpos),''),        IFNULL(CONCAT(\";WKST=\",p.wkst),''),\"\\n\",    IFNULL(CONCAT(\"DESCRIPTION:\",p.`comment`,\"\\n\"),''),    \"END:VEVENT\\n\") AS event_icalFROM provisioning.voip_time_sets s JOIN voip_time_periods p ON s.id = p.time_set_id");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "time_set_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "start",
  { data_type => "datetime", is_nullable => 1, datetime_undef_if_invalid => 1, },
  "comment",
  { data_type => "text", },
  "rrule_ical",
  { data_type => "text", is_nullable => 1 },
  "event_ical",
  { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->belongs_to(
  "voip_time_periods",
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

NGCP::Schema::Result::v_time_periods_ical - VIEW

=head1 DESCRIPTION

This module is a schema class for the NGCP database view "provisioning.v_time_periods_ical".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<v_time_periods_ical>

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
