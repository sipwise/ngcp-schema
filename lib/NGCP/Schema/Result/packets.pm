package NGCP::Schema::Result::packets;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("sipstats.packets");


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
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::packets

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<sipstats.packets>

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


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xyCGQ5SkZR7CCIQUdOkTlA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
