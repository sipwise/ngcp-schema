package NGCP::Schema::provisioning::Result::voip_sound_handles;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_sound_handles");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "group",
  "NGCP::Schema::provisioning::Result::voip_sound_groups",
  { id => "group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "voip_sound_files",
  "NGCP::Schema::provisioning::Result::voip_sound_files",
  { "foreign.handle_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_sound_handles

=head1 TABLE: C<voip_sound_handles>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_sound_groups>

=head2 voip_sound_files

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_sound_files>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SvSvbzOThy+v0UgS1Ipfnw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
