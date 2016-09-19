package NGCP::Schema::Result::events;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("accounting.events");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "subscriber_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "reseller_id",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "old_status",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "new_status",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "timestamp",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "export_status",
  {
    data_type => "enum",
    default_value => "unexported",
    extra => { list => ["unexported", "ok", "filtered", "failed"] },
    is_nullable => 0,
  },
  "exported_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
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

NGCP::Schema::Result::events

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<events>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 old_status

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 new_status

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 timestamp

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 export_status

  data_type: 'enum'
  default_value: 'unexported'
  extra: {list => ["unexported","ok","filtered","failed"]}
  is_nullable: 0

=head2 exported_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kC9VZ6cqTzOuhZ5SPiw16A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
