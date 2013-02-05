package NGCP::Schema::billing::Result::contract_registers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("contract_registers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "actor",
  { data_type => "varchar", is_nullable => 1, size => 15 },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "data",
  { data_type => "text", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::billing::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::contract_registers

=head1 TABLE: C<contract_registers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 actor

  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 data

  data_type: 'text'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contracts>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4M+qzIJAGNdiUjC1rTMf/Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
