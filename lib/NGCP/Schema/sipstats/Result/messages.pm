package NGCP::Schema::sipstats::Result::messages;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("messages");


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
  "protocol",
  {
    data_type => "enum",
    extra => { list => ["IPv4", "IPv6"] },
    is_nullable => 0,
  },
  "transport",
  {
    data_type => "enum",
    extra => { list => ["UDP", "TCP"] },
    is_nullable => 0,
  },
  "src_ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "dst_ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "src_port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "dst_port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "payload",
  { data_type => "blob", is_nullable => 0 },
  "method",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "cseq_method",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "request_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "caller_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::sipstats::Result::messages

=head1 TABLE: C<messages>

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

=head2 protocol

  data_type: 'enum'
  extra: {list => ["IPv4","IPv6"]}
  is_nullable: 0

=head2 transport

  data_type: 'enum'
  extra: {list => ["UDP","TCP"]}
  is_nullable: 0

=head2 src_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 dst_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 src_port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 dst_port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 payload

  data_type: 'blob'
  is_nullable: 0

=head2 method

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 cseq_method

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 request_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 caller_uuid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 callee_uuid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Zf45hwF5XpL0mNnGszsFGQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
