package NGCP::Schema::Result::sca_subscriptions;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.sca_subscriptions");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "aor",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "event",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "expires",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "state",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "app_idx",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "record_route",
  { data_type => "text", is_nullable => 1 },
  "notify_cseq",
  { data_type => "integer", is_nullable => 0 },
  "subscribe_cseq",
  { data_type => "integer", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint(
  "sca_subscriptions_idx",
  ["subscriber", "call_id", "from_tag", "to_tag"],
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

NGCP::Schema::Result::sca_subscriptions

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.sca_subscriptions".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.sca_subscriptions>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 aor

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 event

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 expires

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 state

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 app_idx

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 record_route

  data_type: 'text'
  is_nullable: 1

=head2 notify_cseq

  data_type: 'integer'
  is_nullable: 0

=head2 subscribe_cseq

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<sca_subscriptions_idx>

=over 4

=item * L</subscriber>

=item * L</call_id>

=item * L</from_tag>

=item * L</to_tag>

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
