package NGCP::Schema::Result::emergency_mappings;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.emergency_mappings");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "emergency_container_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "code",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "prefix",
  { data_type => "varchar", is_nullable => 1, size => 32 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("ec_code_idx", ["emergency_container_id", "code"]);


__PACKAGE__->belongs_to(
  "emergency_container",
  "NGCP::Schema::Result::emergency_containers",
  { id => "emergency_container_id" },
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

NGCP::Schema::Result::emergency_mappings

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<emergency_mappings>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 emergency_container_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 code

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 prefix

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<ec_code_idx>

=over 4

=item * L</emergency_container_id>

=item * L</code>

=back

=head1 RELATIONS

=head2 emergency_container

Type: belongs_to

Related object: L<NGCP::Schema::Result::emergency_containers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KiqD/xb7g3DKFirHcaSp6Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
