package NGCP::Schema::billing::Result::voip_intercept;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_intercept");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "liid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "number",
  { data_type => "varchar", is_nullable => 1, size => 63 },
  "cc_required",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "delivery_host",
  { data_type => "varchar", is_nullable => 1, size => 15 },
  "delivery_port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "delivery_user",
  { data_type => "text", is_nullable => 1 },
  "delivery_pass",
  { data_type => "text", is_nullable => 1 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
  "deleted",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::billing::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::voip_intercept

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_intercept>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 liid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 number

  data_type: 'varchar'
  is_nullable: 1
  size: 63

=head2 cc_required

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 delivery_host

  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 delivery_port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 delivery_user

  data_type: 'text'
  is_nullable: 1

=head2 delivery_pass

  data_type: 'text'
  is_nullable: 1

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ons7g/rhT7flX1JiRqaSww


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
