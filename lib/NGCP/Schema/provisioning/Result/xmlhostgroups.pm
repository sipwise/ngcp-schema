package NGCP::Schema::provisioning::Result::xmlhostgroups;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("xmlhostgroups");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "host_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "group",
  "NGCP::Schema::provisioning::Result::xmlgroups",
  { id => "group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "host",
  "NGCP::Schema::provisioning::Result::xmlhosts",
  { id => "host_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::xmlhostgroups

=head1 TABLE: C<xmlhostgroups>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 host_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::xmlgroups>

=head2 host

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::xmlhosts>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MkulOQsxvuxv7U7hbYAe8Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
