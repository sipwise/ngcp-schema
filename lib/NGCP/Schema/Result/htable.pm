package NGCP::Schema::Result::htable;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.009';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.htable");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "key_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "key_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "value_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "key_value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "expires",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
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

NGCP::Schema::Result::htable

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.htable>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 key_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 key_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 value_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 key_value

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 expires

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
