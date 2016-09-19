package NGCP::Schema::Result::billing_network_blocks;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.billing_network_blocks");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "network_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "mask",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "_ipv4_net_from",
  { data_type => "varbinary", is_nullable => 1, size => 4 },
  "_ipv4_net_to",
  { data_type => "varbinary", is_nullable => 1, size => 4 },
  "_ipv6_net_from",
  { data_type => "varbinary", is_nullable => 1, size => 16 },
  "_ipv6_net_to",
  { data_type => "varbinary", is_nullable => 1, size => 16 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "network",
  "NGCP::Schema::Result::billing_networks",
  { id => "network_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::billing_network_blocks

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing_network_blocks>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 network_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 mask

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 _ipv4_net_from

  data_type: 'varbinary'
  is_nullable: 1
  size: 4

=head2 _ipv4_net_to

  data_type: 'varbinary'
  is_nullable: 1
  size: 4

=head2 _ipv6_net_from

  data_type: 'varbinary'
  is_nullable: 1
  size: 16

=head2 _ipv6_net_to

  data_type: 'varbinary'
  is_nullable: 1
  size: 16

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 network

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_networks>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7vHzERt6w8YPQuO1I6zPTg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
