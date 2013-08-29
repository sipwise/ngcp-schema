package NGCP::Schema::Result::voip_pbx_groups;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.004';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_pbx_groups");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "number_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "extension",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "hunt_policy",
  {
    data_type => "enum",
    default_value => "serial",
    extra => { list => ["serial", "parallel"] },
    is_nullable => 0,
  },
  "hunt_policy_timeout",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "voip_number",
  "NGCP::Schema::Result::voip_numbers",
  { id => "number_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "provisioning_voip_subscribers",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { "foreign.pbx_group_id" => "self.id" },
  #{ is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qpw0gD+LaI+g0k3EWr42tQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->meta->make_immutable;
1;
