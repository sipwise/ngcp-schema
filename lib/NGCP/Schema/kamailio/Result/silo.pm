package NGCP::Schema::kamailio::Result::silo;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("silo");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "src_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "dst_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "inc_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "exp_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "snd_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ctype",
  {
    data_type => "varchar",
    default_value => "text/plain",
    is_nullable => 0,
    size => 32,
  },
  "body",
  { data_type => "blob", is_nullable => 0 },
  "extra_hdrs",
  { data_type => "text", is_nullable => 0 },
  "callid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "status",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::silo

=head1 TABLE: C<silo>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 src_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 dst_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 inc_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 exp_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 snd_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ctype

  data_type: 'varchar'
  default_value: 'text/plain'
  is_nullable: 0
  size: 32

=head2 body

  data_type: 'blob'
  is_nullable: 0

=head2 extra_hdrs

  data_type: 'text'
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 status

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n3U2b3I+czkviW8mWpxZsA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
