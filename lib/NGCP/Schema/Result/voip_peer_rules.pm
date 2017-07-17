package NGCP::Schema::Result::voip_peer_rules;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_peer_rules");

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
  "callee_prefix",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "callee_pattern",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 64 },
  "caller_pattern",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "enabled",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "stopper",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
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

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_peer_rules

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_peer_rules>

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

=head2 callee_prefix

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 callee_pattern

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 64

=head2 caller_pattern

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 enabled

  data_type: 'tinyint'
  is_nullable: 0
  default_value: 1

=head2 stopper

  data_type: 'tinyint'
  is_nullable: 0
  default_value: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_peer_groups>