package NGCP::Schema::Result::invoices;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


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
  "contract_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "serial",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "period_start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "period_end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "amount_net",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "amount_vat",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "amount_total",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
  "data",
  { data_type => "mediumblob", is_nullable => 1 },
  "sent_date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "generator",
  {
    data_type => "enum",
    extra => { list => ["auto", "web"] },
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("serial_idx", ["serial"]);


__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::billing_contracts",
  { id => "contract_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


__PACKAGE__->has_many(
  "contract_balances",
  "NGCP::Schema::Result::contract_balances",
  { "foreign.invoice_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::billing_orders",
  { "foreign.invoice_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::invoices

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<invoices>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 contract_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 serial

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 period_start

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 period_end

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 amount_net

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 amount_vat

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 amount_total

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=head2 data

  data_type: 'mediumblob'
  is_nullable: 1

=head2 sent_date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 generator

  data_type: 'enum'
  extra: {list => ["auto","web"]}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<serial_idx>

=over 4

=item * L</serial>

=back

=head1 RELATIONS

=head2 contract

Type: belongs_to

Related object: L<NGCP::Schema::Result::billing_contracts>

=head2 contract_balances

Type: has_many

Related object: L<NGCP::Schema::Result::contract_balances>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::billing_orders>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3pDXso9o3vlER+agjA2QPQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
