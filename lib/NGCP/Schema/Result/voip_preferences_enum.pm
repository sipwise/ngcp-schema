package NGCP::Schema::Result::voip_preferences_enum;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_preferences_enum");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "preference_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "label",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "value",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "usr_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "dom_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "peer_pref",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "default_val",
  { data_type => "tinyint", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "preference",
  "NGCP::Schema::Result::voip_preferences",
  { id => "preference_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_preferences_enum

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_preferences_enum>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 preference_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 label

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 value

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 usr_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 dom_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 peer_pref

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 default_val

  data_type: 'tinyint'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 preference

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_preferences>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OV9kMBzgf+aKB/ZCA3oQuQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
