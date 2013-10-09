package NGCP::Schema::Result::presentity;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.006';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.presentity");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "event",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "etag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "expires",
  { data_type => "integer", is_nullable => 0 },
  "received_time",
  { data_type => "integer", is_nullable => 0 },
  "body",
  { data_type => "blob", is_nullable => 0 },
  "sender",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("presentity_idx", ["username", "domain", "event", "etag"]);

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

NGCP::Schema::Result::presentity

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.presentity>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 event

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 etag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 expires

  data_type: 'integer'
  is_nullable: 0

=head2 received_time

  data_type: 'integer'
  is_nullable: 0

=head2 body

  data_type: 'blob'
  is_nullable: 0

=head2 sender

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<presentity_idx>

=over 4

=item * L</username>

=item * L</domain>

=item * L</event>

=item * L</etag>

=back
