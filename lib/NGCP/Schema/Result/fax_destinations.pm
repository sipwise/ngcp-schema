package NGCP::Schema::Result::fax_destinations;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.fax_destinations");

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

NGCP::Schema::Result::fax_destinations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.fax_destinations>

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
