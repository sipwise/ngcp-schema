package NGCP::Schema::Result::trusted;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.trusted");


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
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::trusted

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.trusted>

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


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6hCtfqG0t2Oua4AB9q4aXg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
