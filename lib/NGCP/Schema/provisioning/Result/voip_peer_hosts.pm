package NGCP::Schema::provisioning::Result::voip_peer_hosts;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_peer_hosts");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "host",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "port",
  { data_type => "integer", default_value => 5060, is_nullable => 0 },
  "transport",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "weight",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "via_lb",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("grpname", ["group_id", "name"]);


__PACKAGE__->belongs_to(
  "group",
  "NGCP::Schema::provisioning::Result::voip_peer_groups",
  { id => "group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "voip_peer_preferences",
  "NGCP::Schema::provisioning::Result::voip_peer_preferences",
  { "foreign.peer_host_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_peer_hosts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_peer_hosts>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 host

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 port

  data_type: 'integer'
  default_value: 5060
  is_nullable: 0

=head2 transport

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 weight

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 via_lb

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<grpname>

=over 4

=item * L</group_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_groups>

=head2 voip_peer_preferences

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ah+lO01FTRId51459hRZBw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
