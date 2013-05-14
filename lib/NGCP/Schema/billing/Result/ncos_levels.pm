package NGCP::Schema::billing::Result::ncos_levels;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("ncos_levels");


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
  "level",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "mode",
  {
    data_type => "enum",
    default_value => "blacklist",
    extra => { list => ["blacklist", "whitelist"] },
    is_nullable => 0,
  },
  "local_ac",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("reslev_idx", ["reseller_id", "level"]);


__PACKAGE__->has_many(
  "ncos_lnp_lists",
  "NGCP::Schema::billing::Result::ncos_lnp_list",
  { "foreign.ncos_level_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "ncos_pattern_lists",
  "NGCP::Schema::billing::Result::ncos_pattern_list",
  { "foreign.ncos_level_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

NGCP::Schema::billing::Result::ncos_levels

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<ncos_levels>

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

=head2 level

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 mode

  data_type: 'enum'
  default_value: 'blacklist'
  extra: {list => ["blacklist","whitelist"]}
  is_nullable: 0

=head2 local_ac

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reslev_idx>

=over 4

=item * L</reseller_id>

=item * L</level>

=back

=head1 RELATIONS

=head2 ncos_lnp_lists

Type: has_many

Related object: L<NGCP::Schema::billing::Result::ncos_lnp_list>

=head2 ncos_pattern_lists

Type: has_many

Related object: L<NGCP::Schema::billing::Result::ncos_pattern_list>

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IsORiLD9bnbuvYPVSksfbQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
