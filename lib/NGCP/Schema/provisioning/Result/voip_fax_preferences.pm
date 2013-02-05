package NGCP::Schema::provisioning::Result::voip_fax_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_fax_preferences");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "active",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "send_status",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "send_copy",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("subscriberid_idx", ["subscriber_id"]);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::provisioning::Result::voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_fax_preferences

=head1 TABLE: C<voip_fax_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 active

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 send_status

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 send_copy

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<subscriberid_idx>

=over 4

=item * L</subscriber_id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EGhEcaS0NPteqUN4dtSuaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
