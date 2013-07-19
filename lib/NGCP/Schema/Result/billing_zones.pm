package NGCP::Schema::Result::billing_zones;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.billing_zones");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "billing_profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "zone",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "detail",
  { data_type => "varchar", is_nullable => 1, size => 127 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("profnamdes_idx", ["billing_profile_id", "zone", "detail"]);


__PACKAGE__->has_many(
  "billing_fees",
  "NGCP::Schema::Result::billing_fees",
  { "foreign.billing_zone_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::Result::billing_profiles",
  { id => "billing_profile_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "billing_zones_histories",
  "NGCP::Schema::Result::billing_zones_history",
  { "foreign.bz_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::billing_zones

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.billing_zones>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
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

=head1 UNIQUE CONSTRAINTS

=head2 C<profnamdes_idx>

=over 4

=item * L</billing_profile_id>

=item * L</zone>

=item * L</detail>

=back

=head1 RELATIONS

=head2 billing_fees

Type: has_many

Related object: L<NGCP::Schema::Result::billing_fees>

=head2 billing_profile

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_profiles>

=head2 billing_zones_histories

Type: has_many

Related object: L<NGCP::Schema::Result::billing_zones_history>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wUp76Orr9EWY2LhRQtOeTw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
