package NGCP::Schema::provisioning::Result::voip_cf_destinations;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("voip_cf_destinations");


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
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "destination_set",
  "NGCP::Schema::provisioning::Result::voip_cf_destination_sets",
  { id => "destination_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_cf_destinations

=head1 TABLE: C<voip_cf_destinations>

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

Related object: L<NGCP::Schema::provisioning::Result::voip_cf_destination_sets>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:34:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AxmEISiEaeruyh1+WicR8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
