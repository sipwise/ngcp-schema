package NGCP::Schema::carrier::Result::numbers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("numbers");


__PACKAGE__->add_columns(
  "number",
  { data_type => "varchar", is_nullable => 0, size => 42 },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("number");


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::carrier::Result::subscribers",
  { id => "subscriber_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::carrier::Result::numbers

=head1 TABLE: C<numbers>

=head1 ACCESSORS

=head2 number

  data_type: 'varchar'
  is_nullable: 0
  size: 42

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</number>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::carrier::Result::subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ubzj19lLfeixYuUoRkkJyA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
