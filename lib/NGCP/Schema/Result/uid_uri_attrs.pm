package NGCP::Schema::Result::uid_uri_attrs;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.uid_uri_attrs");

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
  "did",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "flags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "scheme",
  { data_type => "varchar", default_value => "sip", is_nullable => 0, size => 8 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint(
  "uriattrs_idx",
  ["username", "did", "name", "value", "scheme"],
);

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

NGCP::Schema::Result::uid_uri_attrs

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.uid_uri_attrs>

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

=head2 did

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 value

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 flags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 scheme

  data_type: 'varchar'
  default_value: 'sip'
  is_nullable: 0
  size: 8

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<uriattrs_idx>

=over 4

=item * L</username>

=item * L</did>

=item * L</name>

=item * L</value>

=item * L</scheme>

=back
