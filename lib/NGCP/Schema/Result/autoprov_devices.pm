package NGCP::Schema::Result::autoprov_devices;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.autoprov_devices");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "vendor",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "model",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "front_image",
  { data_type => "mediumblob", is_nullable => 1 },
  "front_image_type",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "mac_image",
  { data_type => "mediumblob", is_nullable => 1 },
  "mac_image_type",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "num_lines",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "bootstrap_method",
  {
    data_type => "enum",
    default_value => "http",
    extra => {
      list => [
        "http",
        "redirect_panasonic",
        "redirect_yealink",
        "redirect_polycom",
        "redirect_snom",
      ],
    },
    is_nullable => 1,
  },
  "bootstrap_uri",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 255 },
  "type",
  {
    data_type => "enum",
    default_value => "phone",
    extra => { list => ["phone", "extension"] },
    is_nullable => 1,
  },
  "extensions_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->has_many(
  "autoprov_configs",
  "NGCP::Schema::Result::autoprov_configs",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_device_extensions_devices",
  "NGCP::Schema::Result::autoprov_device_extensions",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_device_extensions_extensions",
  "NGCP::Schema::Result::autoprov_device_extensions",
  { "foreign.extension_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_device_line_ranges",
  "NGCP::Schema::Result::autoprov_device_line_ranges",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_firmwares",
  "NGCP::Schema::Result::autoprov_firmwares",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_redirect_credentials",
  "NGCP::Schema::Result::autoprov_redirect_credentials",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "autoprov_syncs",
  "NGCP::Schema::Result::autoprov_sync",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_dev_preferences",
  "NGCP::Schema::Result::voip_dev_preferences",
  { "foreign.device_id" => "self.id" },
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

NGCP::Schema::Result::autoprov_devices

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<autoprov_devices>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 vendor

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 model

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 front_image

  data_type: 'mediumblob'
  is_nullable: 1

=head2 front_image_type

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 mac_image

  data_type: 'mediumblob'
  is_nullable: 1

=head2 mac_image_type

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 num_lines

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bootstrap_method

  data_type: 'enum'
  default_value: 'http'
  extra: {list => ["http","redirect_panasonic","redirect_yealink","redirect_polycom","redirect_snom"]}
  is_nullable: 1

=head2 bootstrap_uri

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=head2 type

  data_type: 'enum'
  default_value: 'phone'
  extra: {list => ["phone","extension"]}
  is_nullable: 1

=head2 extensions_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 autoprov_configs

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_configs>

=head2 autoprov_device_extensions_devices

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_device_extensions>

=head2 autoprov_device_extensions_extensions

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_device_extensions>

=head2 autoprov_device_line_ranges

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_device_line_ranges>

=head2 autoprov_firmwares

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_firmwares>

=head2 autoprov_redirect_credentials

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_redirect_credentials>

=head2 autoprov_syncs

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_sync>

=head2 voip_dev_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_dev_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9c3jfxUfxQwMwMKcJFMVsw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
