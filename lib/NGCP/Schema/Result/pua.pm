package NGCP::Schema::Result::pua;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.pua");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "pres_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "pres_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "event",
  { data_type => "integer", is_nullable => 0 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "desired_expires",
  { data_type => "integer", is_nullable => 0 },
  "flag",
  { data_type => "integer", is_nullable => 0 },
  "etag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "tuple_id",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "watcher_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "cseq",
  { data_type => "integer", is_nullable => 0 },
  "record_route",
  { data_type => "text", is_nullable => 1 },
  "contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "remote_contact",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "version",
  { data_type => "integer", is_nullable => 0 },
  "extra_headers",
  { data_type => "text", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("pua_idx", ["etag", "tuple_id", "call_id", "from_tag"]);

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

NGCP::Schema::Result::pua

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.pua>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 pres_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 pres_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 event

  data_type: 'integer'
  is_nullable: 0

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 desired_expires

  data_type: 'integer'
  is_nullable: 0

=head2 flag

  data_type: 'integer'
  is_nullable: 0

=head2 etag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 tuple_id

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 watcher_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 cseq

  data_type: 'integer'
  is_nullable: 0

=head2 record_route

  data_type: 'text'
  is_nullable: 1

=head2 contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 remote_contact

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 version

  data_type: 'integer'
  is_nullable: 0

=head2 extra_headers

  data_type: 'text'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<pua_idx>

=over 4

=item * L</etag>

=item * L</tuple_id>

=item * L</call_id>

=item * L</from_tag>

=back
