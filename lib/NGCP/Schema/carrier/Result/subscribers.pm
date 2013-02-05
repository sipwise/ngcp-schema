package NGCP::Schema::carrier::Result::subscribers;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("subscribers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "webusername",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("domwebuser_idx", ["domain", "webusername"]);


__PACKAGE__->add_unique_constraint("externalid_idx", ["external_id"]);


__PACKAGE__->add_unique_constraint("usrdom_idx", ["username", "domain"]);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::carrier::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "numbers",
  "NGCP::Schema::carrier::Result::numbers",
  { "foreign.subscriber_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::carrier::Result::subscribers

=head1 TABLE: C<subscribers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 webusername

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<domwebuser_idx>

=over 4

=item * L</domain>

=item * L</webusername>

=back

=head2 C<externalid_idx>

=over 4

=item * L</external_id>

=back

=head2 C<usrdom_idx>

=over 4

=item * L</username>

=item * L</domain>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::carrier::Result::contracts>

=head2 numbers

Type: has_many

Related object: L<NGCP::Schema::carrier::Result::numbers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:51
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a8R7tZQhbu4kVGnJ11NDwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
