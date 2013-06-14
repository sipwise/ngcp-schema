package NGCP::Schema::provisioning::Result::voip_fax_destinations;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_fax_destinations");


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
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "filetype",
  {
    data_type => "enum",
    default_value => "TIFF",
    extra => { list => ["PS", "TIFF", "PDF", "PDF14"] },
    is_nullable => 0,
  },
  "cc",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "incoming",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "outgoing",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "status",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("subdest_idx", ["subscriber_id", "destination"]);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::provisioning::Result::voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_fax_destinations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_fax_destinations>

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

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 filetype

  data_type: 'enum'
  default_value: 'TIFF'
  extra: {list => ["PS","TIFF","PDF","PDF14"]}
  is_nullable: 0

=head2 cc

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 incoming

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 outgoing

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 status

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<subdest_idx>

=over 4

=item * L</subscriber_id>

=item * L</destination>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xc8QXAeU0RBRJjk73GhWRQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
