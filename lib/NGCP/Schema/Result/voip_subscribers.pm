package NGCP::Schema::Result::voip_subscribers;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.003';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.voip_subscribers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 127 },
  "domain_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "status",
  {
    data_type => "enum",
    default_value => "active",
    extra => { list => ["active", "locked", "terminated"] },
    is_nullable => 0,
  },
  "primary_number_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("uuid_idx", ["uuid"]);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "domain",
  "NGCP::Schema::Result::domains",
  { id => "domain_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->belongs_to(
  "primary_number",
  "NGCP::Schema::Result::voip_numbers",
  { id => "primary_number_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "SET NULL",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "voip_numbers",
  "NGCP::Schema::Result::voip_numbers",
  { "foreign.subscriber_id" => "self.id" },
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

NGCP::Schema::Result::voip_subscribers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.voip_subscribers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head2 domain_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 status

  data_type: 'enum'
  default_value: 'active'
  extra: {list => ["active","locked","terminated"]}
  is_nullable: 0

=head2 primary_number_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<uuid_idx>

=over 4

=item * L</uuid>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::contracts>

=head2 domain

Type: belongs_to

Related object: L<NGCP::Schema::Result::domains>

=head2 primary_number

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_numbers>

=head2 voip_numbers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_numbers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qT/XQFGM1l0ygvjRpIy47g


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->might_have(
  "provisioning_voip_subscriber",
  'NGCP::Schema::Result::provisioning_voip_subscribers',
  { 'foreign.uuid' => 'self.uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->meta->make_immutable;
1;
