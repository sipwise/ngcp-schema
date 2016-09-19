package NGCP::Schema::Result::voip_peer_inbound_rules;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_peer_inbound_rules");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "field",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "pattern",
  { data_type => "varchar", is_nullable => 0, size => 1023 },
  "reject_code",
  { data_type => "integer", is_nullable => 1 },
  "reject_reason",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "priority",
  {
    data_type => "integer",
    default_value => 50,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "enabled",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "group",
  "NGCP::Schema::Result::voip_peer_groups",
  { id => "group_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_peer_inbound_rules

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_peer_inbound_rules>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 field

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 pattern

  data_type: 'varchar'
  is_nullable: 0
  size: 1023

=head2 reject_code

  data_type: 'integer'
  is_nullable: 1

=head2 reject_reason

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 priority

  data_type: 'integer'
  default_value: 50
  extra: {unsigned => 1}
  is_nullable: 0

=head2 enabled

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_peer_groups>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lks1kJhizhxAnEbV9ZjB1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
