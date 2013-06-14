package NGCP::Schema::provisioning::Result::voip_rewrite_rule_sets;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_rewrite_rule_sets");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "caller_in_dpid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "callee_in_dpid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "caller_out_dpid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "callee_out_dpid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("name_idx", ["name"]);


__PACKAGE__->has_many(
  "voip_rewrite_rules",
  "NGCP::Schema::provisioning::Result::voip_rewrite_rules",
  { "foreign.set_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_rewrite_rule_sets

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_rewrite_rule_sets>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 caller_in_dpid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 callee_in_dpid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 caller_out_dpid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 callee_out_dpid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<name_idx>

=over 4

=item * L</name>

=back

=head1 RELATIONS

=head2 voip_rewrite_rules

Type: has_many

Related object: L<NGCP::Schema::provisioning::Result::voip_rewrite_rules>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E83+aO7pKNeQcmn4u1IF8w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
