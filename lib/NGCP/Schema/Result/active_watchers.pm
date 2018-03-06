package NGCP::Schema::Result::active_watchers;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.active_watchers");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "presentity_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "watcher_username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "watcher_domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_user",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "event",
  {
    data_type => "varchar",
    default_value => "presence",
    is_nullable => 0,
    size => 64,
  },
  "event_id",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "callid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "local_cseq",
  { data_type => "integer", is_nullable => 0 },
  "remote_cseq",
  { data_type => "integer", is_nullable => 0 },
  "contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "record_route",
  { data_type => "text", is_nullable => 1 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "status",
  { data_type => "integer", default_value => 2, is_nullable => 0 },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "version",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "socket_info",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "local_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "from_user",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "from_domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "updated",
  { data_type => "integer", is_nullable => 0 },
  "updated_winfo",
  { data_type => "integer", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("active_watchers_idx", ["callid", "to_tag", "from_tag"]);

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

NGCP::Schema::Result::active_watchers

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.active_watchers".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.active_watchers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 presentity_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 watcher_username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 watcher_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_user

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 event

  data_type: 'varchar'
  default_value: 'presence'
  is_nullable: 0
  size: 64

=head2 event_id

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 callid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 local_cseq

  data_type: 'integer'
  is_nullable: 0

=head2 remote_cseq

  data_type: 'integer'
  is_nullable: 0

=head2 contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 record_route

  data_type: 'text'
  is_nullable: 1

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 status

  data_type: 'integer'
  default_value: 2
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 version

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 socket_info

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 local_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 from_user

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 from_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 updated

  data_type: 'integer'
  is_nullable: 0

=head2 updated_winfo

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<active_watchers_idx>

=over 4

=item * L</callid>

=item * L</to_tag>

=item * L</from_tag>

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
