package NGCP::Schema::kamailio::Result::dialog;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("dialog");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "hash_entry",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hash_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "callid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "caller_cseq",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "callee_cseq",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "caller_route_set",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "callee_route_set",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "caller_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "callee_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "caller_sock",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "callee_sock",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "state",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "start_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "timeout",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "sflags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "toroute_name",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "req_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "iflags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "xdata",
  { data_type => "varchar", is_nullable => 1, size => 512 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::dialog

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<dialog>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 hash_entry

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hash_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 caller_cseq

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 callee_cseq

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 caller_route_set

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 callee_route_set

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 caller_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 callee_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 caller_sock

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 callee_sock

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 state

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 start_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 timeout

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sflags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 toroute_name

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 req_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 iflags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 xdata

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5AYfLQz7gyYiDyViW/PVNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
