package NGCP::Schema::Result::subscriber;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.subscriber");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "email_address",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ha1",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ha1b",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "rpid",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "timezone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "datetime_created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("account_idx", ["username", "domain"]);

__PACKAGE__->belongs_to(
  "provisioning_voip_subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { 'foreign.uuid' => 'self.uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "fax_journal",
  "NGCP::Schema::Result::fax_journal",
  { 'foreign.subscriber_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "topup_log",
  "NGCP::Schema::Result::topup_logs",
  { 'foreign.subscriber_id' => 'self.id' },
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

NGCP::Schema::Result::subscriber

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "kamailio.subscriber".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.subscriber>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 40

=head2 email_address

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ha1

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ha1b

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 rpid

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 timezone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 datetime_created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<account_idx>

=over 4

=item * L</username>

=item * L</domain>

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
