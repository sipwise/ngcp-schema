package NGCP::Schema::Result::fax_journal;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.fax_journal");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "the_timestamp",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "duration",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "direction",
  {
    data_type => "enum",
    default_value => "in",
    extra => { list => ["in", "out"] },
    is_nullable => 0,
  },
  "peer_number",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "peer_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "pages",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "signal_rate",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "quality",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "filename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
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

NGCP::Schema::Result::fax_journal

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.fax_journal>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 the_timestamp

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 duration

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 direction

  data_type: 'enum'
  default_value: 'in'
  extra: {list => ["in","out"]}
  is_nullable: 0

=head2 peer_number

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 peer_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 pages

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 signal_rate

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 quality

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 filename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TEf0WRwgQKpJvAFVrHG6SA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
