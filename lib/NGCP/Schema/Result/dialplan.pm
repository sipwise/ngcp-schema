package NGCP::Schema::Result::dialplan;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.dialplan");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "dpid",
  { data_type => "integer", is_nullable => 0 },
  "pr",
  { data_type => "integer", is_nullable => 0 },
  "match_op",
  { data_type => "integer", is_nullable => 0 },
  "match_exp",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "match_len",
  { data_type => "integer", is_nullable => 0 },
  "subst_exp",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "repl_exp",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "attrs",
  { data_type => "varchar", is_nullable => 0, size => 32 },
);

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::dialplan

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.dialplan>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 dpid

  data_type: 'integer'
  is_nullable: 0

=head2 pr

  data_type: 'integer'
  is_nullable: 0

=head2 match_op

  data_type: 'integer'
  is_nullable: 0

=head2 match_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 match_len

  data_type: 'integer'
  is_nullable: 0

=head2 subst_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 repl_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 attrs

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
