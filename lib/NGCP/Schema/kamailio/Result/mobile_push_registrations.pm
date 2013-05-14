package NGCP::Schema::kamailio::Result::mobile_push_registrations;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("mobile_push_registrations");


__PACKAGE__->add_columns(
  "reg_id",
  { data_type => "varbinary", is_nullable => 0, size => 255 },
  "type",
  {
    data_type => "enum",
    extra => { list => ["gcm", "apns"] },
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("reg_id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::mobile_push_registrations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<mobile_push_registrations>

=head1 ACCESSORS

=head2 reg_id

  data_type: 'varbinary'
  is_nullable: 0
  size: 255

=head2 type

  data_type: 'enum'
  extra: {list => ["gcm","apns"]}
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 timestamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</reg_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7gpHsIEJtAYltDjzPjo3pA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
