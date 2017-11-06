package NGCP::Schema::Result::voip_cf_destinations;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_cf_destinations");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "destination_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "priority",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "timeout",
  {
    data_type => "integer",
    default_value => 300,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "announcement_id",
  {
    data_type => "integer",
    extra => { unsigned => 0 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "destination_set",
  "NGCP::Schema::Result::voip_cf_destination_sets",
  { id => "destination_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "voip_sound_handles",
  "NGCP::Schema::Result::voip_sound_handles",
  { id => "announcement_id" },
  { is_deferrable => 1, on_delete => "SET NULL", on_update => "CASCADE" },
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

NGCP::Schema::Result::voip_cf_destinations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_cf_destinations>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 destination_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 priority

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 timeout

  data_type: 'integer'
  default_value: 300
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 destination_set

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_cf_destination_sets>
