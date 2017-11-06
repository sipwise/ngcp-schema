package NGCP::Schema::Result::lcr_rule_target;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.lcr_rule_target");

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
  "rule_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "gw_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "priority",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "weight",
  {
    data_type => "integer",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("rule_id_gw_id_idx", ["rule_id", "gw_id"]);

__PACKAGE__->belongs_to(
  "gw",
  "NGCP::Schema::Result::lcr_gw",
  { id => "gw_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "rule",
  "NGCP::Schema::Result::lcr_rule",
  { id => "rule_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::lcr_rule_target

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.lcr_rule_target>

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

=head2 rule_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 gw_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 priority

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 weight

  data_type: 'integer'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<rule_id_gw_id_idx>

=over 4

=item * L</rule_id>

=item * L</gw_id>

=back

=head1 RELATIONS

=head2 gw

Type: belongs_to

Related object: L<NGCP::Schema::Result::lcr_gw>

=head2 rule

Type: belongs_to

Related object: L<NGCP::Schema::Result::lcr_rule>
