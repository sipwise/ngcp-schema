package NGCP::Schema::provisioning::Result::voip_peer_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_peer_preferences");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "peer_host_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "attribute_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "attribute",
  "NGCP::Schema::provisioning::Result::voip_preferences",
  { id => "attribute_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "peer_host",
  "NGCP::Schema::provisioning::Result::voip_peer_hosts",
  { id => "peer_host_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_peer_preferences

=head1 TABLE: C<voip_peer_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 peer_host_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 attribute_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 attribute

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_preferences>

=head2 peer_host

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_hosts>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NbLL+m8gyaf2PBSw8cHREQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
