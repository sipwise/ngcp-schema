package NGCP::Schema::Result::autoprov_field_devices;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

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
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "identifier",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "station_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "bootstrapped",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "insecure_transfer",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "encryption_key",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("uk_identifier_idx", ["identifier"]);

__PACKAGE__->belongs_to(
  "profile",
  "NGCP::Schema::Result::autoprov_profiles",
  { id => "profile_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
  "autoprov_field_device_lines",
  "NGCP::Schema::Result::autoprov_field_device_lines",
  { "foreign.device_id" => "self.id" },
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

NGCP::Schema::provisioning::Result::autoprov_field_devices

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

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 profile

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::autoprov_profiles>

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>
