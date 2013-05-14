package NGCP::Schema::billing::Result::ncos_pattern_list;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("ncos_pattern_list");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ncos_level_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "pattern",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("levpat_idx", ["ncos_level_id", "pattern"]);


__PACKAGE__->belongs_to(
  "ncos_level",
  "NGCP::Schema::billing::Result::ncos_levels",
  { id => "ncos_level_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::ncos_pattern_list

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<ncos_pattern_list>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ncos_level_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 pattern

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<levpat_idx>

=over 4

=item * L</ncos_level_id>

=item * L</pattern>

=back

=head1 RELATIONS

=head2 ncos_level

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::ncos_levels>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pzEjI9V0NelpRKFcjzPCKw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
