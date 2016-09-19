package NGCP::Schema::Result::reseller_brandings;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.reseller_brandings");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "css",
  { data_type => "mediumtext", is_nullable => 1 },
  "logo",
  { data_type => "mediumblob", is_nullable => 1 },
  "logo_image_type",
  { data_type => "varchar", is_nullable => 1, size => 32 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("reseller_idx", ["reseller_id"]);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
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

NGCP::Schema::Result::reseller_brandings

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<reseller_brandings>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 reseller_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 css

  data_type: 'mediumtext'
  is_nullable: 1

=head2 logo

  data_type: 'mediumblob'
  is_nullable: 1

=head2 logo_image_type

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<reseller_idx>

=over 4

=item * L</reseller_id>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BUIHTKOq0Nz35uYiCzKhtw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
