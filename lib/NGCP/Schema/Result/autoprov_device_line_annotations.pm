package NGCP::Schema::Result::autoprov_device_line_annotations;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.autoprov_device_line_annotations");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "range_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "line_index",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "x",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "y",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "position",
  {
    data_type => "enum",
    extra => {
      list => [
        "top",
        "bottom",
        "left",
        "right",
        "bottomleft",
        "bottomright",
        "topleft",
        "topright",
      ],
    },
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("range_idx_k", ["range_id", "line_index"]);


__PACKAGE__->belongs_to(
  "range",
  "NGCP::Schema::Result::autoprov_device_line_ranges",
  { id => "range_id" },
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

NGCP::Schema::Result::autoprov_device_line_annotations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<autoprov_device_line_annotations>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 range_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 line_index

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 x

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 y

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 position

  data_type: 'enum'
  extra: {list => ["top","bottom","left","right","bottomleft","bottomright","topleft","topright"]}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<range_idx_k>

=over 4

=item * L</range_id>

=item * L</line_index>

=back

=head1 RELATIONS

=head2 range

Type: belongs_to

Related object: L<NGCP::Schema::Result::autoprov_device_line_ranges>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s875eUdprU2ouvkfeloTaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
