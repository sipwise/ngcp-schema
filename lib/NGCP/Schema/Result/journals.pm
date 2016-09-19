package NGCP::Schema::Result::journals;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.journals");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "operation",
  {
    data_type => "enum",
    default_value => "create",
    extra => { list => ["create", "update", "delete"] },
    is_nullable => 0,
  },
  "resource_name",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "resource_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "content_format",
  {
    data_type => "enum",
    default_value => "json",
    extra => { list => ["storable", "json", "json_deflate", "sereal"] },
    is_nullable => 0,
  },
  "content",
  { data_type => "longblob", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::journals

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<journals>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 operation

  data_type: 'enum'
  default_value: 'create'
  extra: {list => ["create","update","delete"]}
  is_nullable: 0

=head2 resource_name

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 resource_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 timestamp

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 content_format

  data_type: 'enum'
  default_value: 'json'
  extra: {list => ["storable","json","json_deflate","sereal"]}
  is_nullable: 0

=head2 content

  data_type: 'longblob'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9LqhjEdoO1pWKpkiVQ8fQQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
