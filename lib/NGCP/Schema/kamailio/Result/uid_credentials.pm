package NGCP::Schema::kamailio::Result::uid_credentials;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("uid_credentials");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "auth_username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "did",
  {
    data_type => "varchar",
    default_value => "_default",
    is_nullable => 0,
    size => 64,
  },
  "realm",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 28 },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ha1",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "ha1b",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "uid",
  { data_type => "varchar", is_nullable => 0, size => 64 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::uid_credentials

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<uid_credentials>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 auth_username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 did

  data_type: 'varchar'
  default_value: '_default'
  is_nullable: 0
  size: 64

=head2 realm

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 28

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ha1

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 ha1b

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 uid

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SGORmth2f0gjTrS3lq97Og


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
