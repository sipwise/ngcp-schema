package NGCP::Schema::Result::invoices;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.invoices");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "year",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "month",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "serial",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "data",
  { data_type => "blob", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("yms_idx", ["year", "month", "serial"]);

__PACKAGE__->has_many(
  "contract_balances",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.invoice_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::orders",
  { "foreign.invoice_id" => "self.id" },
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

NGCP::Schema::Result::invoices

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.invoices>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 year

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 month

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 serial

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 data

  data_type: 'blob'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<yms_idx>

=over 4

=item * L</year>

=item * L</month>

=item * L</serial>

=back

=head1 RELATIONS

=head2 contract_balances

Type: has_many

Related object: L<NGCP::Schema::Result::contract_balances>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::orders>
