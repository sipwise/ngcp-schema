package NGCP::Schema::Result::location_attrs;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.location_attrs");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ruid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "aname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "atype",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "avalue",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "last_modified",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "1900-01-01 00:00:01",
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

NGCP::Schema::Result::location_attrs

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.location_attrs>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ruid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 aname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 atype

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 avalue

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 last_modified

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '1900-01-01 00:00:01'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back