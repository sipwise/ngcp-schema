package NGCP::Schema::kamailio::Result::rls_presentity;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("rls_presentity");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "rlsubs_did",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "resource_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "content_type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "presence_state",
  { data_type => "blob", is_nullable => 0 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "updated",
  { data_type => "integer", is_nullable => 0 },
  "auth_state",
  { data_type => "integer", is_nullable => 0 },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 64 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("rls_presentity_idx", ["rlsubs_did", "resource_uri"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::rls_presentity

=head1 TABLE: C<rls_presentity>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 rlsubs_did

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 resource_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 content_type

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 presence_state

  data_type: 'blob'
  is_nullable: 0

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 updated

  data_type: 'integer'
  is_nullable: 0

=head2 auth_state

  data_type: 'integer'
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<rls_presentity_idx>

=over 4

=item * L</rlsubs_did>

=item * L</resource_uri>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sbH4CMNqhw8xPRmNa6HkUg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
