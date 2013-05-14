package NGCP::Schema::billing::Result::customer_registers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("customer_registers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "customer_id",
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
  "customer",
  "NGCP::Schema::billing::Result::customers",
  { id => "customer_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::customer_registers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<customer_registers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customer_id

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

=head2 customer

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::customers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GZdfF8xCpT8vSY6pbs7zqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
