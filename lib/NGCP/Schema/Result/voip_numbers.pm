package NGCP::Schema::Result::voip_numbers;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.voip_numbers");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cc",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ac",
  { data_type => "varchar", is_nullable => 0, size => 7 },
  "sn",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "reserved", "locked", "deported"] },
    is_nullable => 0,
  },
  "ported",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "list_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("number_idx", ["cc", "ac", "sn"]);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { id => "subscriber_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->has_many(
  "primary_number_owners",
  "NGCP::Schema::Result::voip_subscribers",
  { "foreign.primary_number_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "primary_number_owners_active",
  "NGCP::Schema::Result::voip_subscribers",
  sub {
    my ($self) = @_;
    return { 
        $self->{foreign_alias}.'.primary_number_id' => { -ident => $self->{self_alias}.'.id'},
        $self->{foreign_alias}.'.status' => { '!=' => 'terminated' },
    }; 
  },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

__PACKAGE__->might_have(
  "voip_dbalias",
  "NGCP::Schema::Result::voip_dbaliases",
  sub {
    my ($self) = @_;
    return { 
        $self->{foreign_alias}.'.username' => { "=" => \["concat($$self{self_alias}.cc,$$self{self_alias}.ac,$$self{self_alias}.sn)"] }
    }; 
  },
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

NGCP::Schema::Result::voip_numbers

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "billing.voip_numbers".

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.voip_numbers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 cc

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ac

  data_type: 'varchar'
  is_nullable: 0
  size: 7

=head2 sn

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["active","reserved","locked","deported"]}
  is_nullable: 0

=head2 ported

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 list_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<number_idx>

=over 4

=item * L</cc>

=item * L</ac>

=item * L</sn>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_subscribers>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_subscribers>

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
