package NGCP::Schema::billing::Result::contract_fraud_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("contract_fraud_preferences");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "fraud_interval_limit",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_interval_lock",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_interval_notify",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "fraud_daily_limit",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_daily_lock",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "fraud_daily_notify",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("contract_id", ["contract_id"]);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::billing::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::contract_fraud_preferences

=head1 TABLE: C<contract_fraud_preferences>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 fraud_interval_limit

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_interval_lock

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_interval_notify

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 fraud_daily_limit

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_daily_lock

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 fraud_daily_notify

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<contract_id>

=over 4

=item * L</contract_id>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::contracts>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:og6bOz/sjNRP6MmZ5T5jEQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
