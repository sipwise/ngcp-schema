package NGCP::Schema::Result::cdr;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);


__PACKAGE__->table("accounting.cdr");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "update_time",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "source_user_id",
  { data_type => "char", is_nullable => 0, size => 36 },
  "source_provider_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_external_subscriber_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_external_contract_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "source_account_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "source_user",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_cli",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "source_clir",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "source_ip",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "destination_user_id",
  { data_type => "char", is_nullable => 0, size => 36 },
  "destination_provider_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_external_subscriber_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_external_contract_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "destination_account_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "destination_user",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_user_dialed",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_user_in",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "destination_domain_in",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "peer_auth_user",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "peer_auth_realm",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "call_type",
  {
    data_type => "enum",
    default_value => "call",
    extra => { list => ["call", "cfu", "cft", "cfb", "cfna"] },
    is_nullable => 0,
  },
  "call_status",
  {
    data_type => "enum",
    default_value => "ok",
    extra => {
      list => ["ok", "busy", "noanswer", "cancel", "offline", "timeout", "other"],
    },
    is_nullable => 0,
  },
  "call_code",
  { data_type => "char", is_nullable => 0, size => 3 },
  "init_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "start_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "duration",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source_carrier_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "source_reseller_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "source_customer_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "source_carrier_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_carrier_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_carrier_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_reseller_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_customer_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "destination_reseller_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "destination_customer_cost",
  { data_type => "decimal", is_nullable => 1, size => [10, 2] },
  "destination_carrier_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_free_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_billing_fee_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_carrier_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_reseller_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "destination_customer_billing_zone_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "frag_carrier_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "frag_reseller_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "frag_customer_onpeak",
  { data_type => "tinyint", is_nullable => 1 },
  "is_fragmented",
  { data_type => "tinyint", is_nullable => 1 },
  "split",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rated_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "rating_status",
  {
    data_type => "enum",
    default_value => "unrated",
    extra => { list => ["unrated", "ok", "failed"] },
    is_nullable => 0,
  },
  "exported_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "export_status",
  {
    data_type => "enum",
    default_value => "unexported",
    extra => { list => ["unexported", "ok", "failed"] },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::cdr

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<accounting.cdr>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 update_time

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 source_user_id

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 source_provider_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_external_subscriber_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 source_external_contract_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 source_account_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 source_user

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_cli

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 source_clir

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 source_ip

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 destination_user_id

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 destination_provider_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_external_subscriber_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 destination_external_contract_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 destination_account_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 destination_user

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_user_dialed

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_user_in

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 destination_domain_in

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 peer_auth_user

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 peer_auth_realm

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 call_type

  data_type: 'enum'
  default_value: 'call'
  extra: {list => ["call","cfu","cft","cfb","cfna"]}
  is_nullable: 0

=head2 call_status

  data_type: 'enum'
  default_value: 'ok'
  extra: {list => ["ok","busy","noanswer","cancel","offline","timeout","other"]}
  is_nullable: 0

=head2 call_code

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 init_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 start_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 duration

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source_carrier_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_reseller_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_customer_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 source_carrier_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_carrier_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_carrier_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_reseller_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_customer_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_reseller_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_customer_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [10,2]

=head2 destination_carrier_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_free_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_billing_fee_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_carrier_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_reseller_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 destination_customer_billing_zone_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 frag_carrier_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 frag_reseller_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 frag_customer_onpeak

  data_type: 'tinyint'
  is_nullable: 1

=head2 is_fragmented

  data_type: 'tinyint'
  is_nullable: 1

=head2 split

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rated_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 rating_status

  data_type: 'enum'
  default_value: 'unrated'
  extra: {list => ["unrated","ok","failed"]}
  is_nullable: 0

=head2 exported_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 export_status

  data_type: 'enum'
  default_value: 'unexported'
  extra: {list => ["unexported","ok","failed"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rNMfsyIh9LAGJGoe/or06w

for my $col (qw/init_time start_time/) {
    if(__PACKAGE__->has_column($col)) {
        __PACKAGE__->remove_column($col);
        __PACKAGE__->add_column($col =>
            { data_type => "decimal", is_nullable => 0, size => [13, 3], inflate_datetime => 'epoch_milli' }
        );
    }
}

__PACKAGE__->meta->make_immutable;
