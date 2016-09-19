package NGCP::Schema::Result::package_profile_sets;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.package_profile_sets");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "package_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "discriminator",
  {
    data_type => "enum",
    extra => { list => ["initial", "underrun", "topup"] },
    is_nullable => 0,
  },
  "profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "network_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "network",
  "NGCP::Schema::Result::billing_networks",
  { id => "network_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "package",
  "NGCP::Schema::Result::profile_packages",
  { id => "package_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "profile_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::package_profile_sets

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<package_profile_sets>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 package_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 discriminator

  data_type: 'enum'
  extra: {list => ["initial","underrun","topup"]}
  is_nullable: 0

=head2 profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 network_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 network

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_networks>

=head2 package

Type: belongs_to

Related object: L<NGCP::Schema::Result::profile_packages>

=head2 profile

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XbWWGgasMdxEtxPGxfbGyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
