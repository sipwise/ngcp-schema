package NGCP::Schema::kamailio::Result::dispatcher;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '1.003';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("dispatcher");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "setid",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "destination",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 192 },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "priority",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "attrs",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
);


__PACKAGE__->set_primary_key("id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::dispatcher

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<dispatcher>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 setid

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 destination

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 192

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 priority

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 attrs

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5jzrLkll7DO38SycdSaTXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
