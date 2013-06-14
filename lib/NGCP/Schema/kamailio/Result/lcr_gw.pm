package NGCP::Schema::kamailio::Result::lcr_gw;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("lcr_gw");


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
  "gw_name",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "ip_addr",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "hostname",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "port",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "params",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "uri_scheme",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "transport",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "strip",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "tag",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "flags",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "defunct",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "prefix",
  { data_type => "varchar", is_nullable => 1, size => 16 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("lcr_id_gw_name_idx", ["lcr_id", "gw_name"]);


__PACKAGE__->add_unique_constraint("lcr_id_ip_addr_idx", ["lcr_id", "ip_addr"]);


__PACKAGE__->has_many(
  "lcr_rule_targets",
  "NGCP::Schema::kamailio::Result::lcr_rule_target",
  { "foreign.gw_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::lcr_gw

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<lcr_gw>

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

=head2 gw_name

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 hostname

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 port

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 params

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 uri_scheme

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 transport

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 strip

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 tag

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 flags

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 defunct

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 prefix

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<lcr_id_gw_name_idx>

=over 4

=item * L</lcr_id>

=item * L</gw_name>

=back

=head2 C<lcr_id_ip_addr_idx>

=over 4

=item * L</lcr_id>

=item * L</ip_addr>

=back

=head1 RELATIONS

=head2 lcr_rule_targets

Type: has_many

Related object: L<NGCP::Schema::kamailio::Result::lcr_rule_target>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vccxYatUPFzjaEtMjTY4xQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
