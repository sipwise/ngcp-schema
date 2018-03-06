package NGCP::Schema::Result::lcr_gw;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.lcr_gw");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "lcr_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "gw_name",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "ip_addr",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "hostname",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "params",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "uri_scheme",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "transport",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "strip",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "tag",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "flags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "defunct",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "prefix",
  { data_type => "varchar", is_nullable => 1, size => 16 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("lcr_id_gw_name_idx", ["lcr_id", "gw_name"]);

__PACKAGE__->add_unique_constraint("lcr_id_ip_addr_idx", ["lcr_id", "ip_addr"]);

__PACKAGE__->has_many(
  "lcr_rule_targets",
  "NGCP::Schema::Result::lcr_rule_target",
  { "foreign.gw_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

NGCP::Schema::Result::lcr_gw

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.lcr_gw".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.lcr_gw>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 lcr_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 gw_name

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 hostname

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 params

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 uri_scheme

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 transport

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 strip

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 tag

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 flags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 defunct

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 prefix

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<lcr_id_gw_name_idx>

=over 4

=item * L</lcr_id>

=item * L</gw_name>

=back

=head2 C<lcr_id_ip_addr_idx>

=over 4

=item * L</lcr_id>

=item * L</ip_addr>

=back

=head1 RELATIONS

=head2 lcr_rule_targets

Type: has_many

Related object: L<NGCP::Schema::Result::lcr_rule_target>

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
