package NGCP::Schema::provisioning::Result::xmlqueue;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("xmlqueue");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "target",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "ctime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "atime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "tries",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "next_try",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::xmlqueue

=head1 TABLE: C<xmlqueue>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 target

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 ctime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 atime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 tries

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 next_try

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8ogDLQhqvu+wMvhyqmp7yg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
