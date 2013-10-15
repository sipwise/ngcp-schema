package NGCP::Schema::Result::message_packets;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("sipstats.message_packets");


__PACKAGE__->add_columns(
  "message",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "packet",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
);

__PACKAGE__->belongs_to(
  "packet",
  "NGCP::Schema::Result::packets",
  { id => "packet" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "message",
  "NGCP::Schema::Result::messages",
  { id => "message" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->set_primary_key("message", "packet");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::message_packets

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<sipstats.message_packets>

=head1 ACCESSORS

=head2 message

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 packet

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</message>

=item * L</packet>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3CvBPiIZYVwwf8w/PskEcg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
