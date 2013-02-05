package NGCP::Schema::sipstats::Result::message_packets;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("message_packets");


__PACKAGE__->add_columns(
  "message",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "packet",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("message", "packet");
=encoding UTF-8

=head1 NAME

NGCP::Schema::sipstats::Result::message_packets

=head1 TABLE: C<message_packets>

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


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m9hkmSjJZ1kELLsaMofeYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
