package NGCP::Schema::kamailio::Result::address;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("address");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "grp",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "ip_addr",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "mask",
  { data_type => "integer", default_value => 32, is_nullable => 0 },
  "port",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "tag",
  { data_type => "varchar", is_nullable => 1, size => 64 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::address

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<address>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 grp

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 mask

  data_type: 'integer'
  default_value: 32
  is_nullable: 0

=head2 port

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 tag

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2AiRx5PnGWfHeS58iGMXow


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
