package NGCP::Schema::Result::voip_cc_mappings;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_cc_mappings");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 36 },
  "auth_key",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "uuid",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { uuid => "uuid" },
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

NGCP::Schema::Result::voip_cc_mappings

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_cc_mappings>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 uuid

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 36

=head2 auth_key

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 uuid

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GI1YJOJAou+BhB28FSppXg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
