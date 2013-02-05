package NGCP::Schema::kamailio::Result::presentity;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("presentity");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "event",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "etag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "received_time",
  { data_type => "integer", is_nullable => 0 },
  "body",
  { data_type => "blob", is_nullable => 0 },
  "sender",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("presentity_idx", ["username", "domain", "event", "etag"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::presentity

=head1 TABLE: C<presentity>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 event

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 etag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 received_time

  data_type: 'integer'
  is_nullable: 0

=head2 body

  data_type: 'blob'
  is_nullable: 0

=head2 sender

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<presentity_idx>

=over 4

=item * L</username>

=item * L</domain>

=item * L</event>

=item * L</etag>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZaLBs4F3V828YS5sps4UGg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
