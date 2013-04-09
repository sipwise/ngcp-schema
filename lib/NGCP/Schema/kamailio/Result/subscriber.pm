package NGCP::Schema::kamailio::Result::subscriber;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("subscriber");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 40 },
  "email_address",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ha1",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "ha1b",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "rpid",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "timezone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "datetime_created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("account_idx", ["username", "domain"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::subscriber

=head1 TABLE: C<subscriber>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 40

=head2 email_address

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ha1

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 ha1b

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 rpid

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 timezone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 datetime_created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<account_idx>

=over 4

=item * L</username>

=item * L</domain>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5IE/dWdn5C7NB+0v4DTDHQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
