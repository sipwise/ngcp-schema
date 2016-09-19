package NGCP::Schema::Result::mohqueues;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.mohqueues");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 25 },
  "uri",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "mohdir",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "mohfile",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "debug",
  { data_type => "integer", is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("mohqueue_name_idx", ["name"]);


__PACKAGE__->add_unique_constraint("mohqueue_uri_idx", ["uri"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::mohqueues

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<mohqueues>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 25

=head2 uri

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 mohdir

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 mohfile

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 debug

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<mohqueue_name_idx>

=over 4

=item * L</name>

=back

=head2 C<mohqueue_uri_idx>

=over 4

=item * L</uri>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qOVBsfqzUug2noD4hDqGiA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
