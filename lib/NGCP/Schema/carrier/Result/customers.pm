package NGCP::Schema::carrier::Result::customers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("customers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "url",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "shopuser",
  { data_type => "varchar", is_nullable => 1, size => 31 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("externalid_idx", ["external_id"]);


__PACKAGE__->add_unique_constraint("shopuser_idx", ["shopuser"]);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::carrier::Result::contracts",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::carrier::Result::orders",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::carrier::Result::customers

=head1 TABLE: C<customers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 shopuser

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<externalid_idx>

=over 4

=item * L</external_id>

=back

=head2 C<shopuser_idx>

=over 4

=item * L</shopuser>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::carrier::Result::contracts>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::carrier::Result::orders>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EOy9TLNdHl9yCZDpfqWxjA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
