package NGCP::Schema::billing::Result::billing_fees_history;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("billing_fees_history");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "bf_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "billing_profile_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "billing_zones_history_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "source",
  { data_type => "varchar", default_value => ".", is_nullable => 0, size => 255 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "direction",
  {
    data_type => "enum",
    default_value => "out",
    extra => { list => ["in", "out"] },
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    default_value => "call",
    extra => { list => ["call", "sms"] },
    is_nullable => 0,
  },
  "onpeak_init_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "onpeak_init_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "onpeak_follow_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "onpeak_follow_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "offpeak_init_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "offpeak_init_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "offpeak_follow_rate",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "offpeak_follow_interval",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "use_free_time",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "bf",
  "NGCP::Schema::billing::Result::billing_fees",
  { id => "bf_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
);


__PACKAGE__->belongs_to(
  "billing_zones_history",
  "NGCP::Schema::billing::Result::billing_zones_history",
  { id => "billing_zones_history_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::billing_fees_history

=head1 TABLE: C<billing_fees_history>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 bf_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 billing_zones_history_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source

  data_type: 'varchar'
  default_value: '.'
  is_nullable: 0
  size: 255

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 direction

  data_type: 'enum'
  default_value: 'out'
  extra: {list => ["in","out"]}
  is_nullable: 0

=head2 type

  data_type: 'enum'
  default_value: 'call'
  extra: {list => ["call","sms"]}
  is_nullable: 0

=head2 onpeak_init_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 onpeak_init_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 onpeak_follow_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 onpeak_follow_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 offpeak_init_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 offpeak_init_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 offpeak_follow_rate

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 offpeak_follow_interval

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 use_free_time

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 bf

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::billing_fees>

=head2 billing_zones_history

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::billing_zones_history>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MMt6wWsX8L2m+p6HxGUFWQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
