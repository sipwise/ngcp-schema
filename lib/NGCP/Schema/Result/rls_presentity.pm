package NGCP::Schema::Result::rls_presentity;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.rls_presentity");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "rlsubs_did",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "resource_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "content_type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "presence_state",
  { data_type => "blob", is_nullable => 0 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "updated",
  { data_type => "integer", is_nullable => 0 },
  "auth_state",
  { data_type => "integer", is_nullable => 0 },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 64 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("rls_presentity_idx", ["rlsubs_did", "resource_uri"]);

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

NGCP::Schema::Result::rls_presentity

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.rls_presentity>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 rlsubs_did

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 resource_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 content_type

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 presence_state

  data_type: 'blob'
  is_nullable: 0

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 updated

  data_type: 'integer'
  is_nullable: 0

=head2 auth_state

  data_type: 'integer'
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<rls_presentity_idx>

=over 4

=item * L</rlsubs_did>

=item * L</resource_uri>

=back
