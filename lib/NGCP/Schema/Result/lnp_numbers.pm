package NGCP::Schema::Result::lnp_numbers;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.lnp_numbers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "number",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "routing_number",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "lnp_provider_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("l_n_lnpproidnumber_idx", ["lnp_provider_id", "number"]);


__PACKAGE__->belongs_to(
  "lnp_provider",
  "NGCP::Schema::Result::lnp_providers",
  { id => "lnp_provider_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::lnp_numbers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<lnp_numbers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 number

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 routing_number

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 lnp_provider_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 start

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 end

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<l_n_lnpproidnumber_idx>

=over 4

=item * L</lnp_provider_id>

=item * L</number>

=back

=head1 RELATIONS

=head2 lnp_provider

Type: belongs_to

Related object: L<NGCP::Schema::Result::lnp_providers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WDMJ/hTA8y0RNeV1UsvTrw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
