package NGCP::Schema::provisioning::Result::voip_subscribers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_subscribers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "domain_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "admin",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "account_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "webusername",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "webpassword",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "autoconf_displayname",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "autoconf_group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("user_dom_idx", ["username", "domain_id"]);


__PACKAGE__->add_unique_constraint("uuid_idx", ["uuid"]);


__PACKAGE__->add_unique_constraint("webuser_dom_idx", ["webusername", "domain_id"]);


__PACKAGE__->belongs_to(
  "domain",
  "NGCP::Schema::provisioning::Result::voip_domains",
  { id => "domain_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "voip_cc_mappings",
  "NGCP::Schema::provisioning::Result::voip_cc_mappings",
  { "foreign.uuid" => "self.uuid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_cf_destination_sets",
  "NGCP::Schema::provisioning::Result::voip_cf_destination_sets",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_cf_mappings",
  "NGCP::Schema::provisioning::Result::voip_cf_mappings",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_cf_time_sets",
  "NGCP::Schema::provisioning::Result::voip_cf_time_sets",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_contacts",
  "NGCP::Schema::provisioning::Result::voip_contacts",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_dbaliases",
  "NGCP::Schema::provisioning::Result::voip_dbaliases",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_fax_destinations",
  "NGCP::Schema::provisioning::Result::voip_fax_destinations",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "voip_fax_preference",
  "NGCP::Schema::provisioning::Result::voip_fax_preferences",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->might_have(
  "voip_reminder",
  "NGCP::Schema::provisioning::Result::voip_reminder",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_speed_dials",
  "NGCP::Schema::provisioning::Result::voip_speed_dial",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_trusted_sources",
  "NGCP::Schema::provisioning::Result::voip_trusted_sources",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_usr_preferences",
  "NGCP::Schema::provisioning::Result::voip_usr_preferences",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_subscribers

=head1 TABLE: C<voip_subscribers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 domain_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 admin

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 account_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 webusername

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 webpassword

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 autoconf_displayname

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 autoconf_group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<user_dom_idx>

=over 4

=item * L</username>

=item * L</domain_id>

=back

=head2 C<uuid_idx>

=over 4

=item * L</uuid>

=back

=head2 C<webuser_dom_idx>

=over 4

=item * L</webusername>

=item * L</domain_id>

=back

=head1 RELATIONS

=head2 domain

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_domains>

=head2 voip_cc_mappings

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_cc_mappings>

=head2 voip_cf_destination_sets

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_destination_sets>

=head2 voip_cf_mappings

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_mappings>

=head2 voip_cf_time_sets

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_time_sets>

=head2 voip_contacts

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_contacts>

=head2 voip_dbaliases

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_dbaliases>

=head2 voip_fax_destinations

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_fax_destinations>

=head2 voip_fax_preference

Type: might_have

Related object: L<NGCP::Schema::provisioning::Result::voip_fax_preferences>

=head2 voip_reminder

Type: might_have

Related object: L<NGCP::Schema::provisioning::Result::voip_reminder>

=head2 voip_speed_dials

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_speed_dial>

=head2 voip_trusted_sources

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_trusted_sources>

=head2 voip_usr_preferences

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_usr_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:okeFYyJXfaBDYk7od/ASSg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
