package NGCP::Schema::Result::voip_contract_location_blocks;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_contract_location_blocks");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "location_id",
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


__PACKAGE__->add_unique_constraint("vclb_unique_location_block", ["location_id", "ip", "mask"]);


__PACKAGE__->belongs_to(
  "location",
  "NGCP::Schema::Result::voip_contract_locations",
  { id => "location_id" },
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

NGCP::Schema::Result::voip_contract_location_blocks

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_contract_location_blocks>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 location_id

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

=head1 UNIQUE CONSTRAINTS

=head2 C<vclb_unique_location_block>

=over 4

=item * L</location_id>

=item * L</ip>

=item * L</mask>

=back

=head1 RELATIONS

=head2 location

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_contract_locations>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D+iZddC6/4lrsZE8Nk2JdA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
