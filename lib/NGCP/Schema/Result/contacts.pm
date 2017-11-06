package NGCP::Schema::Result::contacts;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.contacts");

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
  "gender",
  {
    data_type => "enum",
    extra => { list => ["male", "female"] },
    is_nullable => 1,
  },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "comregnum",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "street",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "postcode",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "country",
  { data_type => "char", is_nullable => 1, size => 2 },
  "phonenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "mobilenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "newsletter",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "faxnumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "iban",
  { data_type => "varchar", is_nullable => 1, size => 34 },
  "bic",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "vatnum",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "bankname",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp0",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp1",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp2",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp3",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp4",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp5",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp6",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp7",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp8",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "gpp9",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "terminate_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => [ "active", "terminated"] },
    is_nullable => 0,
  },
  "timezone",
  { data_type => "varchar", is_nullable => 1, size => 80 },
);

__PACKAGE__->set_primary_key("id");

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

__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::contracts",
  { "foreign.contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "customers_comm_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.comm_contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "customers_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "customers_tech_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.tech_contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::orders",
  { "foreign.delivery_contact_id" => "self.id" },
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

NGCP::Schema::Result::contacts

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.contacts".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.contacts>

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

=head2 gender

  data_type: 'enum'
  extra: {list => ["male","female"]}
  is_nullable: 1

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 comregnum

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 street

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 postcode

  data_type: 'integer'
  is_nullable: 1

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 country

  data_type: 'char'
  is_nullable: 1
  size: 2

=head2 phonenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 mobilenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 newsletter

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 faxnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 timezone

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::Result::contracts>

=head2 customers_comm_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 customers_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 customers_tech_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::orders>

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
