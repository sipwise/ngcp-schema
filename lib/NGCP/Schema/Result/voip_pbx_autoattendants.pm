package NGCP::Schema::Result::voip_pbx_autoattendants;
use Scalar::Util qw(blessed);
our $VERSION = '2.009';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use parent 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_pbx_autoattendants");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "choice",
  { data_type => "tinyint", is_nullable => 0 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 256 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::provisioning::Result::voip_subscribers",
  { id => "subscriber_id" },
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

NGCP::Schema::provisioning::Result::voip_pbx_autoattendants

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<voip_pbx_autoattendants>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 choice

  data_type: 'tinyint'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::provisioning::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-10-14 14:08:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uOk7D6xRi3/TqRyLelv18g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
