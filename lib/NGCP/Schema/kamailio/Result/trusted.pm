package NGCP::Schema::kamailio::Result::trusted;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("trusted");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "src_ip",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "proto",
  { data_type => "varchar", is_nullable => 0, size => 4 },
  "from_pattern",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "tag",
  { data_type => "varchar", is_nullable => 1, size => 64 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::trusted

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<trusted>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 src_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 proto

  data_type: 'varchar'
  is_nullable: 0
  size: 4

=head2 from_pattern

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 tag

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J9Vfnyr9SNrbP8UTGunBuw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
