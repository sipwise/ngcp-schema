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
  "pbx_hunt_policy",
  {
    data_type => "enum",
    default_value => "serial",
    extra => { list => ["serial", "parallel", "random", "circular"] },
    is_nullable => 1,
  },
  "pbx_hunt_timeout",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "pbx_extension",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "profile_set_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "profile_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_pbx_pilot",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
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
  "upn_rewrite_sets",
  "NGCP::Schema::Result::upn_rewrite_set",
  { "foreign.subscriber_id" => "self.id" },
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
  "voip_cf_source_sets",
  "NGCP::Schema::Result::voip_cf_source_sets",
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

__PACKAGE__->has_many(
  "voip_fax_journals",
  "NGCP::Schema::Result::voip_fax_journal",
  { 'foreign.subscriber_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "sms_journals",
  "NGCP::Schema::Result::sms_journal",
  { 'foreign.subscriber_id' => 'self.id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_mail_to_fax_secrets_renew_notify",
  "NGCP::Schema::Result::voip_mail_to_fax_secret_renew_notify",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_mail_to_fax_acls",
  "NGCP::Schema::Result::voip_mail_to_fax_acl",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "voip_mail_to_fax_preference",
  "NGCP::Schema::Result::voip_mail_to_fax_preferences",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_pbx_groups",
  "NGCP::Schema::Result::voip_pbx_groups",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_pbx_group_members",
  "NGCP::Schema::Result::voip_pbx_groups",
  { "foreign.group_id" => "self.id" },
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

__PACKAGE__->belongs_to(
  "voip_subscriber_profile",
  "NGCP::Schema::Result::voip_subscriber_profiles",
  { "foreign.id" => "self.profile_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "voip_subscriber_profile_left",
  "NGCP::Schema::Result::voip_subscriber_profiles",
  { "foreign.id" => "self.profile_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => 'left' },
);

__PACKAGE__->belongs_to(
  "voip_subscriber_profile_set",
  "NGCP::Schema::Result::voip_subscriber_profile_sets",
  { "foreign.id" => "self.profile_set_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "kamailio_subscriber",
  'NGCP::Schema::Result::subscriber',
  { 'foreign.uuid' => 'self.uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "rtc_session",
  "NGCP::Schema::Result::rtc_session",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "sipwise_mam_user",
  'NGCP::Schema::Result::sipwise_mam',
  sub {
    my $args = shift;
    return {
        "$args->{foreign_alias}.username" => { '=' => \"concat($args->{self_alias}.username,\"@\",domain.domain)" } ,
    };
  },
  { join_type => 'inner' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "sipwise_mam_with",
  'NGCP::Schema::Result::sipwise_mam',
  sub {
    my $args = shift;
    return {
        "$args->{foreign_alias}.with" => { '=' => \"concat($args->{self_alias}.username,\"@\",domain.domain)" } ,
    };
  },
  { join_type => 'inner' },
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

=head1 DESCRIPTION

This module is a schema class for the NGCP database table "provisioning.voip_subscribers".

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

=head2 upn_rewrite_sets

Type: has_many

Related object: L<NGCP::Schema::Result::upn_rewrite_set>

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

=head2 voip_cf_source_sets

Type: has_many

Related object: L<NGCP::Schema::Result::voip_cf_source_sets>

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

=head2 voip_fax_journals

Type: has_many

Related object: L<NGCP::Schema::Result::voip_fax_journal>

=head2 sms_journals

Type: has_many

Related object: L<NGCP::Schema::Result::sms_journal>

=head2 voip_mail_to_fax_preference

Type: might_have

Related object: L<NGCP::Schema::Result::voip_mail_to_fax_preferences>

=head2 voip_mail_to_fax_secrets_renew_notify

Type: has_many

Related object: L<NGCP::Schema::Result::voip_mail_to_fax_secret_renew_notify>

=head2 voip_mail_to_fax_acls

Type: has_many

Related object: L<NGCP::Schema::Result::voip_mail_to_fax_acl>

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

=head2 rtc_session

Type: might_have

Related object: L<NGCP::Schema::Result::rtc_session>

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2017 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this package.  If not, see <https://www.gnu.org/licenses/>.
