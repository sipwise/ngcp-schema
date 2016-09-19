package NGCP::Schema::Result::version;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.version");


__PACKAGE__->add_columns(
  "table_name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "table_version",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);


__PACKAGE__->add_unique_constraint("table_name_idx", ["table_name"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::version

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<version>

=head1 ACCESSORS

=head2 table_name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 table_version

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head1 UNIQUE CONSTRAINTS

=head2 C<table_name_idx>

=over 4

=item * L</table_name>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Xhsxc42m1wC4MZB961aZHg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
