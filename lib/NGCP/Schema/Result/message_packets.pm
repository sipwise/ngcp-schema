package NGCP::Schema::Result::message_packets;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

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

1;
__END__

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