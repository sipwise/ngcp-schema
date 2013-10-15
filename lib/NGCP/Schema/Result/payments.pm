package NGCP::Schema::Result::payments;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.payments");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "amount",
  { data_type => "integer", is_nullable => 1 },
  "type",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "state",
  {
    data_type => "enum",
    extra => { list => ["init", "transact", "failed", "success"] },
    is_nullable => 1,
  },
  "mpaytid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "status",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "errno",
  { data_type => "integer", is_nullable => 1 },
  "returncode",
  { data_type => "varchar", is_nullable => 1, size => 63 },
  "externalstatus",
  { data_type => "text", is_nullable => 1 },
  "modify_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "create_timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->has_many(
  "credit_payments",
  "NGCP::Schema::Result::credit_payments",
  { "foreign.payment_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "order_payments",
  "NGCP::Schema::Result::order_payments",
  { "foreign.payment_id" => "self.id" },
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

NGCP::Schema::Result::payments

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.payments>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 amount

  data_type: 'integer'
  is_nullable: 1

=head2 type

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 state

  data_type: 'enum'
  extra: {list => ["init","transact","failed","success"]}
  is_nullable: 1

=head2 mpaytid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 errno

  data_type: 'integer'
  is_nullable: 1

=head2 returncode

  data_type: 'varchar'
  is_nullable: 1
  size: 63

=head2 externalstatus

  data_type: 'text'
  is_nullable: 1

=head2 modify_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 create_timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 credit_payments

Type: has_many

Related object: L<NGCP::Schema::Result::credit_payments>

=head2 order_payments

Type: has_many

Related object: L<NGCP::Schema::Result::order_payments>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zW9AaD/pkQ5yi4/lNeRq0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
