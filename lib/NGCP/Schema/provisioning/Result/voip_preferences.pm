package NGCP::Schema::provisioning::Result::voip_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_preferences");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "attribute",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "type",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "max_occur",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "usr_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "dom_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "peer_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "internal",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "data_type",
  {
    data_type => "enum",
    extra => { list => ["boolean", "int", "string", "enum"] },
    is_nullable => 1,
  },
  "read_only",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("attribute_idx", ["attribute"]);


__PACKAGE__->has_many(
  "voip_dom_preferences",
  "NGCP::Schema::provisioning::Result::voip_dom_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_peer_preferences",
  "NGCP::Schema::provisioning::Result::voip_peer_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_preferences_enums",
  "NGCP::Schema::provisioning::Result::voip_preferences_enum",
  { "foreign.preference_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_usr_preferences",
  "NGCP::Schema::provisioning::Result::voip_usr_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_preferences

=head1 TABLE: C<voip_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 attribute

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 type

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 max_occur

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 usr_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 dom_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 peer_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 internal

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 data_type

  data_type: 'enum'
  extra: {list => ["boolean","int","string","enum"]}
  is_nullable: 1

=head2 read_only

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<attribute_idx>

=over 4

=item * L</attribute>

=back

=head1 RELATIONS

=head2 voip_dom_preferences

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_dom_preferences>

=head2 voip_peer_preferences

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_peer_preferences>

=head2 voip_preferences_enums

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_preferences_enum>

=head2 voip_usr_preferences

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_usr_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nTXS0lnMB6gIJjvfedRDvA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
