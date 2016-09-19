package NGCP::Schema::Result::pt_checksums;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("ngcp.pt_checksums");


__PACKAGE__->add_columns(
  "db",
  { data_type => "char", is_nullable => 0, size => 64 },
  "tbl",
  { data_type => "char", is_nullable => 0, size => 64 },
  "chunk",
  { data_type => "integer", is_nullable => 0 },
  "chunk_time",
  { data_type => "float", is_nullable => 1 },
  "chunk_index",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "lower_boundary",
  { data_type => "text", is_nullable => 1 },
  "upper_boundary",
  { data_type => "text", is_nullable => 1 },
  "this_crc",
  { data_type => "char", is_nullable => 0, size => 40 },
  "this_cnt",
  { data_type => "integer", is_nullable => 0 },
  "master_crc",
  { data_type => "char", is_nullable => 1, size => 40 },
  "master_cnt",
  { data_type => "integer", is_nullable => 1 },
  "ts",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("db", "tbl", "chunk");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::pt_checksums

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<pt_checksums>

=head1 ACCESSORS

=head2 db

  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 tbl

  data_type: 'char'
  is_nullable: 0
  size: 64

=head2 chunk

  data_type: 'integer'
  is_nullable: 0

=head2 chunk_time

  data_type: 'float'
  is_nullable: 1

=head2 chunk_index

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 lower_boundary

  data_type: 'text'
  is_nullable: 1

=head2 upper_boundary

  data_type: 'text'
  is_nullable: 1

=head2 this_crc

  data_type: 'char'
  is_nullable: 0
  size: 40

=head2 this_cnt

  data_type: 'integer'
  is_nullable: 0

=head2 master_crc

  data_type: 'char'
  is_nullable: 1
  size: 40

=head2 master_cnt

  data_type: 'integer'
  is_nullable: 1

=head2 ts

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</db>

=item * L</tbl>

=item * L</chunk>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tko07ubM8QzUZI5gnmM8Qg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
