package NGCP::Schema::provisioning::Result::voip_peer_groups;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_peer_groups");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "priority",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "peering_contract_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("name", ["name"]);


__PACKAGE__->has_many(
  "voip_peer_hosts",
  "NGCP::Schema::provisioning::Result::voip_peer_hosts",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_peer_rules",
  "NGCP::Schema::provisioning::Result::voip_peer_rules",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_peer_groups

=head1 TABLE: C<voip_peer_groups>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 priority

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 peering_contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<name>

=over 4

=item * L</name>

=back

=head1 RELATIONS

=head2 voip_peer_hosts

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_hosts>

=head2 voip_peer_rules

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_rules>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c55LWz8pAbB+YyO6DuXahA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
