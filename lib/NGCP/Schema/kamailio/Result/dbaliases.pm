package NGCP::Schema::kamailio::Result::dbaliases;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("dbaliases");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "alias_username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "alias_domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("alias_idx", ["alias_username", "alias_domain"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::dbaliases

=head1 TABLE: C<dbaliases>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 alias_username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 alias_domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<alias_idx>

=over 4

=item * L</alias_username>

=item * L</alias_domain>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FRhzs0cqafLwuHh/Grzg3Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
