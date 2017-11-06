package NGCP::Schema::Result::dialog_vars;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.dialog_vars");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "hash_entry",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hash_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "dialog_key",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "dialog_value",
  { data_type => "varchar", is_nullable => 0, size => 512 },
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

NGCP::Schema::Result::dialog_vars

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.dialog_vars>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 hash_entry

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hash_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 dialog_key

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 dialog_value

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
