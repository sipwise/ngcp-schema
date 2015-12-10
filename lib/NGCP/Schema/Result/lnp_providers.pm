package NGCP::Schema::Result::lnp_providers;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.lnp_providers");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "prefix",
  { data_type => "varchar", is_nullable => 0, size => 32 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "lnp_numbers",
  "NGCP::Schema::Result::lnp_numbers",
  { "foreign.lnp_provider_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "ncos_lnp_lists",
  "NGCP::Schema::Result::ncos_lnp_list",
  { "foreign.lnp_provider_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

NGCP::Schema::Result::lnp_providers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.lnp_providers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 lnp_numbers

Type: has_many

Related object: L<NGCP::Schema::Result::lnp_numbers>

=head2 ncos_lnp_lists

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_lnp_list>
