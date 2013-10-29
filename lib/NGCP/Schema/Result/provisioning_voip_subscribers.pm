package NGCP::Schema::Result::provisioning_voip_subscribers;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_subscribers");

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
  "pbx_group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_pbx_group",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
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
  "NGCP::Schema::Result::voip_domains",
  { id => "domain_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "voip_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { uuid => "uuid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_cc_mappings",
  "NGCP::Schema::Result::voip_cc_mappings",
  { "foreign.uuid" => "self.uuid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_cf_destination_sets",
  "NGCP::Schema::Result::voip_cf_destination_sets",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_cf_mappings",
  "NGCP::Schema::Result::voip_cf_mappings",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_cf_time_sets",
  "NGCP::Schema::Result::voip_cf_time_sets",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_contacts",
  "NGCP::Schema::Result::voip_contacts",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_dbaliases",
  "NGCP::Schema::Result::voip_dbaliases",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_fax_destinations",
  "NGCP::Schema::Result::voip_fax_destinations",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "voip_fax_preference",
  "NGCP::Schema::Result::voip_fax_preferences",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "voip_reminder",
  "NGCP::Schema::Result::voip_reminder",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_speed_dials",
  "NGCP::Schema::Result::voip_speed_dial",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_trusted_sources",
  "NGCP::Schema::Result::voip_trusted_sources",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_usr_preferences",
  "NGCP::Schema::Result::voip_usr_preferences",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "voip_pbx_group",
  "NGCP::Schema::Result::voip_pbx_groups",
  { 'foreign.id' => 'self.pbx_group_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "autoprov_field_device_lines",
  "NGCP::Schema::Result::autoprov_field_device_lines",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_one(
  "voip_subscriber",
  'NGCP::Schema::Result::voip_subscribers',
  { 'foreign.uuid' => 'self.uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { 'foreign.id' => 'self.account_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_one(
  "voicemail_user",
  "NGCP::Schema::Result::voicemail_users",
  { "foreign.customer_id" => "self.uuid" },
  { cascade_copy => 1, cascade_delete => 1 },
);

__PACKAGE__->has_many(
  "voip_pbx_autoattendants",
  "NGCP::Schema::Result::voip_pbx_autoattendants",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

NGCP::Schema::Result::provisioning_voip_subscribers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_subscribers>

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

=head2 is_pbx_group

  data_type: 'tinyint'
  is_nullable: 0
  default_value: 0

=head2 pbx_group_id

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

Related object: L<NGCP::Schema::Result::voip_domains>

=head2 voip_cc_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::voip_cc_mappings>

=head2 voip_cf_destination_sets

Type: has_many

Related object: L<NGCP::Schema::Result::voip_cf_destination_sets>

=head2 voip_cf_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::voip_cf_mappings>

=head2 voip_cf_time_sets

Type: has_many

Related object: L<NGCP::Schema::Result::voip_cf_time_sets>

=head2 voip_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::voip_contacts>

=head2 voip_dbaliases

Type: has_many

Related object: L<NGCP::Schema::Result::voip_dbaliases>

=head2 voip_fax_destinations

Type: has_many

Related object: L<NGCP::Schema::Result::voip_fax_destinations>

=head2 voip_fax_preference

Type: might_have

Related object: L<NGCP::Schema::Result::voip_fax_preferences>

=head2 voip_reminder

Type: might_have

Related object: L<NGCP::Schema::Result::voip_reminder>

=head2 voip_speed_dials

Type: has_many

Related object: L<NGCP::Schema::Result::voip_speed_dial>

=head2 voip_trusted_sources

Type: has_many

Related object: L<NGCP::Schema::Result::voip_trusted_sources>

=head2 voip_usr_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_usr_preferences>

=head2 voip_pbx_group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_pbx_groups>
