package NGCP::Schema::Result::mohqcalls;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.mohqcalls");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "mohq_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "call_status",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "call_from",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "call_contact",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "call_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("mohqcalls_idx", ["call_id"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::mohqcalls

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<mohqcalls>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mohq_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 call_status

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 call_from

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 call_contact

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 call_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<mohqcalls_idx>

=over 4

=item * L</call_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L5maD//bOTK4toAfORUH7w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
