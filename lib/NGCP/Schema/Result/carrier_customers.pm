package NGCP::Schema::Result::carrier_customers;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("carrier.customers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "external_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "url",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "shopuser",
  { data_type => "varchar", is_nullable => 1, size => 31 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("externalid_idx", ["external_id"]);


__PACKAGE__->add_unique_constraint("shopuser_idx", ["shopuser"]);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::carrier_contracts",
  { "foreign.customer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::carrier_orders",
  { "foreign.customer_id" => "self.id" },
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

NGCP::Schema::Result::carrier_customers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<customers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 external_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 shopuser

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<externalid_idx>

=over 4

=item * L</external_id>

=back

=head2 C<shopuser_idx>

=over 4

=item * L</shopuser>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::Result::carrier_contracts>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::carrier_orders>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GZ7KhJs+RyWqBLgo+zrm3g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
