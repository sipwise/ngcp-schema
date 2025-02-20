package NGCP::Schema::Result::admins;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON", "EncodedColumn");

__PACKAGE__->table("billing.admins");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "role_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "login",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "md5pass",
  {
    data_type => "char",
    is_nullable => 1,
    size => 32,
    encode_column => 1,
    encode_class  => 'Digest',
    encode_args   => {algorithm => 'MD5', format => 'hex'},
    encode_check_method => 'check_password',
  },
  "saltedpass",
  { data_type => "char", size => 54, is_nullable => 1 },
  "is_master",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "is_superuser",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "is_ccare",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "is_active",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "read_only",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "show_passwords",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "call_data",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "billing_data",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "lawful_intercept",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "ssl_client_m_serial",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ssl_client_certificate",
  { data_type => "text", is_nullable => 1 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "can_reset_password",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "is_system",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "saltedpass_modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "ban_increment_stage",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    default_value => 0,
    is_nullable => 0,
  },
  "auth_mode",
  {
    data_type => "enum",
    default_value => "local",
    extra => { list => ["local", "ldap"] },
    is_nullable => 0,
  },
  "enable_2fa",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "show_otp_registration_info",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },   
  "otp_secret",
  {
    data_type => "char",
    is_nullable => 1,
    size => 32,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("login_idx", ["login"]);

__PACKAGE__->add_unique_constraint("ssl_client_m_serial_UNIQUE", ["ssl_client_m_serial"]);

__PACKAGE__->add_unique_constraint("email", ["email"]);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "acl_role",
  "NGCP::Schema::Result::acl_roles",
  {id => "role_id"},
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "last_passwords",
  "NGCP::Schema::Result::admin_password_journal",
  { "foreign.admin_id" => "self.id" },
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

NGCP::Schema::Result::admins

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.admins".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.admins>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 role_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 login

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 md5pass

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 is_master

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 is_superuser

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 is_active

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 read_only

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 show_passwords

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 call_data

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 lawful_intercept

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 ssl_client_m_serial

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 saltedpass_modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 ban_increment_stage

  data_type: 'integer'
  extra: {unsigned => 1}
  default_value: 0
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<login_idx>

=over 4

=item * L</login>

=back

=head2 C<ssl_client_m_serial_UNIQUE>

=over 4

=item * L</ssl_client_m_serial>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

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
