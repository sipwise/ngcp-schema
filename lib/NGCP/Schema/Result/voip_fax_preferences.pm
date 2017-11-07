package NGCP::Schema::Result::voip_fax_preferences;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_fax_preferences");

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
  "password",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "active",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "send_status",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "send_copy",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "t38",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "ecm",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("subscriberid_idx", ["subscriber_id"]);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
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

NGCP::Schema::Result::voip_fax_preferences

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_fax_preferences".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_fax_preferences>

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

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 active

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 send_status

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 send_copy

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 t38

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 ecm

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<subscriberid_idx>

=over 4

=item * L</subscriber_id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>

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
