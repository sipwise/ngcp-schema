package NGCP::Schema::Result::autoprov_field_devices;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.autoprov_field_devices");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "identifier",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "bootstrapped",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "insecure_transfer",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "station_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "encryption_key",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("uk_identifier_idx", ["identifier"]);


__PACKAGE__->has_many(
  "autoprov_field_device_lines",
  "NGCP::Schema::Result::autoprov_field_device_lines",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "profile",
  "NGCP::Schema::Result::autoprov_profiles",
  { id => "profile_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::autoprov_field_devices

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<autoprov_field_devices>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 identifier

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 bootstrapped

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 insecure_transfer

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 station_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 encryption_key

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<uk_identifier_idx>

=over 4

=item * L</identifier>

=back

=head1 RELATIONS

=head2 autoprov_field_device_lines

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_field_device_lines>

=head2 profile

Type: belongs_to

Related object: L<NGCP::Schema::Result::autoprov_profiles>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OM2oUwDzmfM8vw7e1CknRg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
