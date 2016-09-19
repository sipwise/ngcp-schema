package NGCP::Schema::Result::lcr_rule;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.lcr_rule");


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
  "NGCP::Schema::Result::lcr_rule_target",
  { "foreign.rule_id" => "self.id" },
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

NGCP::Schema::Result::lcr_rule

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

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

Related object: L<NGCP::Schema::Result::lcr_rule_target>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gTPA4GEAag13WRcr288y2w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
