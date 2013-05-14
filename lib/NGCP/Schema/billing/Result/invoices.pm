package NGCP::Schema::billing::Result::invoices;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("invoices");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "year",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "month",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "serial",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "data",
  { data_type => "blob", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("yms_idx", ["year", "month", "serial"]);


__PACKAGE__->has_many(
  "contract_balances",
  "NGCP::Schema::billing::Result::contract_balances",
  { "foreign.invoice_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::billing::Result::orders",
  { "foreign.invoice_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::invoices

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<invoices>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 year

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 month

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 serial

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 data

  data_type: 'blob'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<yms_idx>

=over 4

=item * L</year>

=item * L</month>

=item * L</serial>

=back

=head1 RELATIONS

=head2 contract_balances

Type: has_many

Related object: L<NGCP::Schema::billing::Result::contract_balances>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::billing::Result::orders>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:itFB0vabhky1YAHweyr00g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
