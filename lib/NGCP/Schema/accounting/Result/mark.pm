package NGCP::Schema::accounting::Result::mark;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("mark");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "collector",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "acc_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::accounting::Result::mark

=head1 TABLE: C<mark>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 collector

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 acc_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+as/Fw2Z3UO81Cq28dZZ7w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
