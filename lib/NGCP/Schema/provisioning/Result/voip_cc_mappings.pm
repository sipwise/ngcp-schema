package NGCP::Schema::provisioning::Result::voip_cc_mappings;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_cc_mappings");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 36 },
  "auth_key",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "uuid",
  "NGCP::Schema::provisioning::Result::voip_subscribers",
  { uuid => "uuid" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_cc_mappings

=head1 TABLE: C<voip_cc_mappings>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 uuid

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 36

=head2 auth_key

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 uuid

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OolkExIfAfgs0kNyKbpfrw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
