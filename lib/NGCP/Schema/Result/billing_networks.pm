package NGCP::Schema::Result::billing_networks;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.billing_networks");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "terminated"] },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("bn_resname_idx", ["reseller_id", "name"]);


__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::Result::billing_mappings",
  { "foreign.network_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "billing_network_blocks",
  "NGCP::Schema::Result::billing_network_blocks",
  { "foreign.network_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "package_profile_sets",
  "NGCP::Schema::Result::package_profile_sets",
  { "foreign.network_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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
  },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::billing_networks

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing_networks>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["active","terminated"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<bn_resname_idx>

=over 4

=item * L</reseller_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 billing_mappings

Type: has_many

Related object: L<NGCP::Schema::Result::billing_mappings>

=head2 billing_network_blocks

Type: has_many

Related object: L<NGCP::Schema::Result::billing_network_blocks>

=head2 package_profile_sets

Type: has_many

Related object: L<NGCP::Schema::Result::package_profile_sets>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6+zoqzahhmH/vOQTqDWhjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
