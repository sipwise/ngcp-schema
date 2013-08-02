package NGCP::Schema::Result::voip_sound_files;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.003';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_sound_files");


__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "filename",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "data",
  { data_type => "longblob", is_nullable => 1 },
  "handle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "set_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "loopplay",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "codec",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "handle",
  "NGCP::Schema::Result::voip_sound_handles",
  { id => "handle_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->belongs_to(
  "set",
  "NGCP::Schema::Result::voip_sound_sets",
  { id => "set_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
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

NGCP::Schema::Result::voip_sound_files

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_sound_files>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 filename

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 data

  data_type: 'longblob'
  is_nullable: 1

=head2 handle_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 set_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 loopplay

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 codec

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 handle

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_sound_handles>

=head2 set

Type: belongs_to

Related object: L<NGCP::Schema::Result::voip_sound_sets>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rx9kSKu6+3/vmeGrUA6xBQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
