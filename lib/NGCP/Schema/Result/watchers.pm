package NGCP::Schema::Result::watchers;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.watchers");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "presentity_uri",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "watcher_username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "watcher_domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "event",
  {
    data_type => "varchar",
    default_value => "presence",
    is_nullable => 0,
    size => 64,
  },
  "status",
  { data_type => "integer", is_nullable => 0 },
  "reason",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "inserted_time",
  { data_type => "integer", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint(
  "watcher_idx",
  ["presentity_uri", "watcher_username", "watcher_domain", "event"],
);

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

NGCP::Schema::Result::watchers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.watchers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 presentity_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 watcher_username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 watcher_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 event

  data_type: 'varchar'
  default_value: 'presence'
  is_nullable: 0
  size: 64

=head2 status

  data_type: 'integer'
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 inserted_time

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<watcher_idx>

=over 4

=item * L</presentity_uri>

=item * L</watcher_username>

=item * L</watcher_domain>

=item * L</event>

=back
