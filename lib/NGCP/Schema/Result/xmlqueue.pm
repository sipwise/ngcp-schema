package NGCP::Schema::Result::xmlqueue;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.xmlqueue");

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

NGCP::Schema::Result::xmlqueue

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.xmlqueue>

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
