package NGCP::Schema::billing::Result::products;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("products");


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
  "class",
  {
    data_type => "enum",
    extra => {
      list => [
        "sippeering",
        "pstnpeering",
        "reseller",
        "voip",
        "hardware",
        "auxiliary",
      ],
    },
    is_nullable => 0,
  },
  "handle",
  { data_type => "varchar", is_nullable => 0, size => 63 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "on_sale",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "price",
  { data_type => "double precision", is_nullable => 1 },
  "weight",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 1 },
  "billing_profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("reshand_idx", ["reseller_id", "handle"]);


__PACKAGE__->add_unique_constraint("resnam_idx", ["reseller_id", "name"]);


__PACKAGE__->has_many(
  "billing_mappings",
  "NGCP::Schema::billing::Result::billing_mappings",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::billing::Result::billing_profiles",
  { id => "billing_profile_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::billing::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::products

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<products>

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

=head2 class

  data_type: 'enum'
  extra: {list => ["sippeering","pstnpeering","reseller","voip","hardware","auxiliary"]}
  is_nullable: 0

=head2 handle

  data_type: 'varchar'
  is_nullable: 0
  size: 63

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 on_sale

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 price

  data_type: 'double precision'
  is_nullable: 1

=head2 weight

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reshand_idx>

=over 4

=item * L</reseller_id>

=item * L</handle>

=back

=head2 C<resnam_idx>

=over 4

=item * L</reseller_id>

=item * L</name>

=back

=head1 RELATIONS

=head2 billing_mappings

Type: has_many

Related object: L<NGCP::Schema::billing::Result::billing_mappings>

=head2 billing_profile

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::billing_profiles>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xwVaFogM1eKSdLY8wYkeVg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
