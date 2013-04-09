package NGCP::Schema::sipstats::Result::packets;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("packets");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [17, 6] },
  "src_mac",
  { data_type => "binary", is_nullable => 0, size => 6 },
  "dst_mac",
  { data_type => "binary", is_nullable => 0, size => 6 },
  "header",
  { data_type => "blob", is_nullable => 0 },
  "payload",
  { data_type => "blob", is_nullable => 0 },
  "trailer",
  { data_type => "blob", is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::sipstats::Result::packets

=head1 TABLE: C<packets>

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 timestamp

  data_type: 'decimal'
  is_nullable: 0
  size: [17,6]

=head2 src_mac

  data_type: 'binary'
  is_nullable: 0
  size: 6

=head2 dst_mac

  data_type: 'binary'
  is_nullable: 0
  size: 6

=head2 header

  data_type: 'blob'
  is_nullable: 0

=head2 payload

  data_type: 'blob'
  is_nullable: 0

=head2 trailer

  data_type: 'blob'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tPxcCAxmiKJRTPXGRGMMDg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
