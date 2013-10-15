package NGCP::Schema::Result::numbers;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("carrier.numbers");


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
  "NGCP::Schema::Result::subscribers",
  { id => "subscriber_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::numbers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<carrier.numbers>

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

Related object: L<NGCP::Schema::Result::subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ln3HIKttfpB2ZwCbMqOFfw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
