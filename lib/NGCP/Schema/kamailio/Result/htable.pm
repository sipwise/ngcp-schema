package NGCP::Schema::kamailio::Result::htable;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("htable");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "key_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "key_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "value_type",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "key_value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "expires",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::htable

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<htable>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 key_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 key_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 value_type

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 key_value

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 expires

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oflniBOc7IASHvNisa9JGQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
