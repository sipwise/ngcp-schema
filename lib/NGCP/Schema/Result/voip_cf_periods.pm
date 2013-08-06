package NGCP::Schema::Result::voip_cf_periods;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.004';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_cf_periods");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "time_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "year",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "month",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "mday",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "wday",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "hour",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "minute",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "time_set",
  "NGCP::Schema::Result::voip_cf_time_sets",
  { id => "time_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_cf_periods

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_cf_periods>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 time_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 year

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 month

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 mday

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 wday

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 hour

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 minute

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 time_set

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_cf_time_sets>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EKfXw897JzAaeHCNvYm24g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
