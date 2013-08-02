package NGCP::Schema::Result::contacts;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.003';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.contacts");


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
    is_nullable => 1,
  },
  "gender",
  {
    data_type => "enum",
    extra => { list => ["male", "female"] },
    is_nullable => 1,
  },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "comregnum",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "street",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "postcode",
  { data_type => "integer", is_nullable => 1 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "country",
  { data_type => "char", is_nullable => 1, size => 2 },
  "phonenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "mobilenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "newsletter",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
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
  "faxnumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


__PACKAGE__->has_many(
  "contracts",
  "NGCP::Schema::Result::contracts",
  { "foreign.contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "customers_comm_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.comm_contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "customers_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "customers_tech_contacts",
  "NGCP::Schema::Result::customers",
  { "foreign.tech_contact_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "orders",
  "NGCP::Schema::Result::orders",
  { "foreign.delivery_contact_id" => "self.id" },
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

NGCP::Schema::Result::contacts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.contacts>

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
  is_nullable: 1

=head2 gender

  data_type: 'enum'
  extra: {list => ["male","female"]}
  is_nullable: 1

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 comregnum

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 street

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 postcode

  data_type: 'integer'
  is_nullable: 1

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 country

  data_type: 'char'
  is_nullable: 1
  size: 2

=head2 phonenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 mobilenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 newsletter

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

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

=head2 faxnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 contracts

Type: has_many

Related object: L<NGCP::Schema::Result::contracts>

=head2 customers_comm_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 customers_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 customers_tech_contacts

Type: has_many

Related object: L<NGCP::Schema::Result::customers>

=head2 orders

Type: has_many

Related object: L<NGCP::Schema::Result::orders>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f9lGIGrPbefm2oIODZMn0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
