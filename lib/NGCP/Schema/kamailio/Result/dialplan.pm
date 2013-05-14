package NGCP::Schema::kamailio::Result::dialplan;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("dialplan");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "dpid",
  { data_type => "integer", is_nullable => 0 },
  "pr",
  { data_type => "integer", is_nullable => 0 },
  "match_op",
  { data_type => "integer", is_nullable => 0 },
  "match_exp",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "match_len",
  { data_type => "integer", is_nullable => 0 },
  "subst_exp",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "repl_exp",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "attrs",
  { data_type => "varchar", is_nullable => 0, size => 32 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::dialplan

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<dialplan>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 dpid

  data_type: 'integer'
  is_nullable: 0

=head2 pr

  data_type: 'integer'
  is_nullable: 0

=head2 match_op

  data_type: 'integer'
  is_nullable: 0

=head2 match_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 match_len

  data_type: 'integer'
  is_nullable: 0

=head2 subst_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 repl_exp

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 attrs

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qvkr9mDVIXr1Q73ReAcDPw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
