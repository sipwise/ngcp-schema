package NGCP::Schema::Result::voip_fax_journal;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_fax_journal");


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
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "direction",
  {
    data_type => "enum",
    extra => { list => ["in", "out", "mtf"] },
    is_nullable => 0,
  },
  "duration",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "caller",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee",
  { data_type => "varchar", is_nullable => 0, size => 255 },
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
  { data_type => "varchar", is_nullable => 0, size => 255 },
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
  "sid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_fax_journal

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_fax_journal>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 direction

  data_type: 'enum'
  extra: {list => ["in","out","mtf"]}
  is_nullable: 0

=head2 duration

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 caller

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 callee

  data_type: 'varchar'
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

=head2 sid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SwKfDFQT3Aq/BAJqIZwoNQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
