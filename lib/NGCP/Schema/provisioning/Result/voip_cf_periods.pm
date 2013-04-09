package NGCP::Schema::provisioning::Result::voip_cf_periods;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_cf_periods");


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
  "NGCP::Schema::provisioning::Result::voip_cf_time_sets",
  { id => "time_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_cf_periods

=head1 TABLE: C<voip_cf_periods>

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

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_time_sets>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8z8I3w+DREDgV7lg12L9fA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
