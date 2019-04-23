package NGCP::Schema::Result::v_email_templates_missed;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");


__PACKAGE__->table("billing.v_email_templates_missed");
__PACKAGE__->result_source_instance->view_definition("select r.id as reseller_id,r.name as reseller_name, etd.id as email_template_id, etd.name as email_template_name from resellers r 
join email_templates etd on etd.reseller_id is null
left join email_templates et on et.name=etd.name and et.reseller_id=r.id 
where et.id is null order by r.id,etd.id");

__PACKAGE__->add_columns(
  "reseller_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "reseller_name",
  { data_type => "varchar", is_nullable => 0, size => 63 },
  "email_template_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "email_template_name",
  { data_type => "varchar", is_nullable => 0, size => 63 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { "foreign.id" => "self.reseller_id" },
);

__PACKAGE__->belongs_to(
  "email_template",
  "NGCP::Schema::Result::email_templates",
  { "foreign.id" => "self.email_template_id" },
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

NGCP::Schema::Result::v_email_templates_missed - VIEW

=head1 DESCRIPTION

This module is a schema class for the NGCP database view "billing.v_email_templates_missed".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<v_email_templates_missed>

=head1 ACCESSORS

=head2 reseller_id

  data_type: 'integer'
  is_nullable: 0

=head2 reseller_name

  data_type: 'varchar'
  is_nullable: 0

=head2 email_template_id

  data_type: 'integer'
  is_nullable: 0

=head2 email_template_name

  data_type: 'varchar'
  is_nullable: 0

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
