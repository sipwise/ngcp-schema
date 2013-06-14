package NGCP::Schema::kamailio::Result::fax_destinations;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("fax_destinations");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "filetype",
  {
    data_type => "enum",
    default_value => "tiff",
    extra => { list => ["ps", "tiff", "pdf", "pdf14"] },
    is_nullable => 0,
  },
  "cc",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "incoming",
  {
    data_type => "enum",
    default_value => "true",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "outgoing",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "status",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::fax_destinations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<fax_destinations>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 filetype

  data_type: 'enum'
  default_value: 'tiff'
  extra: {list => ["ps","tiff","pdf","pdf14"]}
  is_nullable: 0

=head2 cc

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 incoming

  data_type: 'enum'
  default_value: 'true'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 outgoing

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 status

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mpgbZBxQ1XeCPdE/faCRxw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
