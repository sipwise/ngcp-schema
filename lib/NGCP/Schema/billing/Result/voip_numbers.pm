package NGCP::Schema::billing::Result::voip_numbers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_numbers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cc",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ac",
  { data_type => "varchar", is_nullable => 0, size => 7 },
  "sn",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "reserved", "locked", "deported"] },
    is_nullable => 0,
  },
  "ported",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "list_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("number_idx", ["cc", "ac", "sn"]);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::billing::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::billing::Result::voip_subscribers",
  { id => "subscriber_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "voip_subscribers",
  "NGCP::Schema::billing::Result::voip_subscribers",
  { "foreign.primary_number_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::voip_numbers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_numbers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 cc

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ac

  data_type: 'varchar'
  is_nullable: 0
  size: 7

=head2 sn

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["active","reserved","locked","deported"]}
  is_nullable: 0

=head2 ported

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 list_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<number_idx>

=over 4

=item * L</cc>

=item * L</ac>

=item * L</sn>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::voip_subscribers>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gykfIbXJYZtWkw5kHmNzpQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
