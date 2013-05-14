package NGCP::Schema::provisioning::Result::voip_cf_mappings;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_cf_mappings");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    default_value => "cfu",
    extra => { list => ["cfu", "cfb", "cfna", "cft"] },
    is_nullable => 0,
  },
  "destination_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "time_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "destination_set",
  "NGCP::Schema::provisioning::Result::voip_cf_destination_sets",
  { id => "destination_set_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::provisioning::Result::voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "time_set",
  "NGCP::Schema::provisioning::Result::voip_cf_time_sets",
  { id => "time_set_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_cf_mappings

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_cf_mappings>

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

=head2 type

  data_type: 'enum'
  default_value: 'cfu'
  extra: {list => ["cfu","cfb","cfna","cft"]}
  is_nullable: 0

=head2 destination_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 time_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 destination_set

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_destination_sets>

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>

=head2 time_set

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_time_sets>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m2PZ1R5gcqbw0KnuJCxpaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
