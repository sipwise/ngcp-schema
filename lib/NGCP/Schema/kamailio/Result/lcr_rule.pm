package NGCP::Schema::kamailio::Result::lcr_rule;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("lcr_rule");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "lcr_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "prefix",
  { data_type => "varchar", is_nullable => 1, size => 16 },
  "request_uri",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 64 },
  "from_uri",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "stopper",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "enabled",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint(
  "lcr_id_prefix_from_uri_idx",
  ["lcr_id", "prefix", "from_uri", "request_uri", "group_id"],
);


__PACKAGE__->has_many(
  "lcr_rule_targets",
  "NGCP::Schema::kamailio::Result::lcr_rule_target",
  { "foreign.rule_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::lcr_rule

=head1 TABLE: C<lcr_rule>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 lcr_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 prefix

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 request_uri

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 64

=head2 from_uri

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 stopper

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 enabled

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<lcr_id_prefix_from_uri_idx>

=over 4

=item * L</lcr_id>

=item * L</prefix>

=item * L</from_uri>

=item * L</request_uri>

=item * L</group_id>

=back

=head1 RELATIONS

=head2 lcr_rule_targets

Type: has_many

Related object: L<NGCP::Schema::kamailio::Result::lcr_rule_target>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7c7i50HCDna6JkjtPNMKsQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
