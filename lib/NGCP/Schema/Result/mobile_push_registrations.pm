package NGCP::Schema::Result::mobile_push_registrations;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.mobile_push_registrations");


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
  "device_id",
  { data_type => "varbinary", is_nullable => 0, size => 255 },
  "timestamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("reg_id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::mobile_push_registrations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

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

=head2 device_id

  data_type: 'varbinary'
  is_nullable: 0
  size: 255

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


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+6hE2bZMSWvQ/9tUVBgE/w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
