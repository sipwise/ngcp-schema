package NGCP::Schema::Result::billing_zones_history;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.billing_zones_history");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "bz_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "billing_profile_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "zone",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "detail",
  { data_type => "varchar", is_nullable => 1, size => 127 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "billing_fees_histories",
  "NGCP::Schema::Result::billing_fees_history",
  { "foreign.billing_zones_history_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "bz",
  "NGCP::Schema::Result::billing_zones",
  { id => "bz_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "NO ACTION",
  },
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

NGCP::Schema::Result::billing_zones_history

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.billing_zones_history>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 bz_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 zone

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 detail

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 billing_fees_histories

Type: has_many

Related object: L<NGCP::Schema::Result::billing_fees_history>

=head2 bz

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_zones>
