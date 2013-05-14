package NGCP::Schema::ngcp::Result::db_schema;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("db_schema");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "revision",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "node",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "applied_at",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("rev_idx", ["revision", "node"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::ngcp::Result::db_schema

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<db_schema>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 revision

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 node

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 applied_at

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<rev_idx>

=over 4

=item * L</revision>

=item * L</node>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6utrm37mYB/OUIjRr02RsQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
