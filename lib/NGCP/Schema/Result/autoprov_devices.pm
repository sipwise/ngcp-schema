package NGCP::Schema::Result::autoprov_devices;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

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
  "type",
  { 
    data_type => "enum",
    default_value => "phone",
    extra => { list => ["phone","extension"] },
    is_nullable => 0,
  },
  "front_image",
  { data_type => "mediumblob", is_nullable => 1 },
  "front_image_type",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "mac_image",
  { data_type => "mediumblob", is_nullable => 1 },
  "mac_image_type",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "bootstrap_method",
  {
    data_type => "enum",
    default_value => "http",
    extra => { list => ["http","redirect_panasonic","redirect_yealink","redirect_polycom"] },
    is_nullable => 1,
  },   
  "bootstrap_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
   "num_extensions",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  }
);

__PACKAGE__->has_many(
  "autoprov_firmwares",
  "NGCP::Schema::Result::autoprov_firmwares",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "autoprov_configs",
  "NGCP::Schema::Result::autoprov_configs",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "autoprov_device_line_ranges",
  "NGCP::Schema::Result::autoprov_device_line_ranges",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "autoprov_sync",
  "NGCP::Schema::Result::autoprov_sync",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "autoprov_redirect_credentials",
  "NGCP::Schema::Result::autoprov_redirect_credentials",
  { "foreign.device_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->set_primary_key("id");

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

NGCP::Schema::provisioning::Result::autoprov_devices

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
