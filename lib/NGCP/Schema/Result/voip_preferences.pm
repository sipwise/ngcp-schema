package NGCP::Schema::Result::voip_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_preferences");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "voip_preference_groups_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
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
  "expose_to_customer",
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
  "expose_to_customer",
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
  "NGCP::Schema::Result::voip_dom_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_peer_preferences",
  "NGCP::Schema::Result::voip_peer_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "voip_preference_group",
  "NGCP::Schema::Result::voip_preference_groups",
  { id => "voip_preference_groups_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "voip_preferences_enums",
  "NGCP::Schema::Result::voip_preferences_enum",
  { "foreign.preference_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_usr_preferences",
  "NGCP::Schema::Result::voip_usr_preferences",
  { "foreign.attribute_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_preferences

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 voip_preference_groups_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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

=head2 expose_to_customer

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

Related object: L<NGCP::Schema::Result::voip_dom_preferences>

=head2 voip_peer_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_peer_preferences>

=head2 voip_preference_group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_preference_groups>

=head2 voip_preferences_enums

Type: has_many

Related object: L<NGCP::Schema::Result::voip_preferences_enum>

=head2 voip_usr_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_usr_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7eJNPcqBgeQIQwSODtcdOQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
