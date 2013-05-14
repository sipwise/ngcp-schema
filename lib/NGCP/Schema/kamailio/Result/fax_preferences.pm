package NGCP::Schema::kamailio::Result::fax_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("fax_preferences");


__PACKAGE__->add_columns(
  "subscriber_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "active",
  {
    data_type => "enum",
    default_value => "true",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_status",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_copy",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_copy_cc",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("subscriber_id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::fax_preferences

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<fax_preferences>

=head1 ACCESSORS

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 active

  data_type: 'enum'
  default_value: 'true'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_status

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_copy

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_copy_cc

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</subscriber_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ojAIbKqxQKuRDm1MgUe7cg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
