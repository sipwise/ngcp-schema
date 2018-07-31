package NGCP::Schema::Result::v_time_sets_ical;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");


__PACKAGE__->table("provisioning.v_time_sets_ical");
__PACKAGE__->result_source_instance->view_definition("select `s`.`name` AS `name`,concat('BEGIN:VCALENDAR\\n','PRODID:-//Mozilla.org/NONSGML Mozilla Calendar V1.1//EN\\n','VERSION:2.0\\n\\n',group_concat(concat('BEGIN:VEVENT\\n','UID:','sipwise',`p`.`id`,'\@sipwise',`s`.`id`,'\\n','SUMMARY:',`s`.`name`,' event ',`p`.`id`,'\\n','DTSTART:',date_format(`p`.`start`,'%Y%m%dT%H%i%s'),'\\n','RRULE:','FREQ=',`p`.`freq`,ifnull(concat(';COUNT=',`p`.`count`),''),ifnull(concat(';UNTIL=',date_format(`p`.`until`,'%Y%m%dT%H%i%s')),''),ifnull(concat(';INTERVAL=',`p`.`interval`),''),ifnull(concat(';BYSECOND=',`p`.`bysecond`),''),ifnull(concat(';BYMINUTE=',`p`.`byminute`),''),ifnull(concat(';BYHOUR=',`p`.`byhour`),''),ifnull(concat(';BYDAY=',`p`.`byday`),''),ifnull(concat(';BYMONTHDAY=',`p`.`bymonthday`),''),ifnull(concat(';BYYEARDAY=',`p`.`byyearday`),''),ifnull(concat(';BYWEEKNO=',`p`.`byweekno`),''),ifnull(concat(';BYMONTH=',`p`.`bymonth`),''),ifnull(concat(';BYSETPOS=',`p`.`bysetpos`),''),'\\n',ifnull(concat('DESCRIPTION:',`p`.`comment`,'\\n'),''),'END:VEVENT\\n') separator '\n'),'END:VCALENDAR\\n') AS `ical` from (`provisioning`.`voip_time_sets` `s` join `provisioning`.`voip_time_periods` `p` on((`s`.`id` = `p`.`time_set_id`))) group by `s`.`id`");


__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 0, size => 90 },
  "ical",
  { data_type => "text", is_nullable => 1 },
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
