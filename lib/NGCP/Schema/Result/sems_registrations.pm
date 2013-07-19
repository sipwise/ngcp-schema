package NGCP::Schema::Result::sems_registrations;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.sems_registrations");


__PACKAGE__->add_columns(
  "subscriber_id",
  { data_type => "integer", is_nullable => 0 },
  "registration_status",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "last_registration",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "expiry",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "last_code",
  { data_type => "smallint", is_nullable => 1 },
  "last_reason",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "contacts",
  { data_type => "varchar", is_nullable => 1, size => 512 },
);


__PACKAGE__->set_primary_key("subscriber_id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::sems_registrations

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.sems_registrations>

=head1 ACCESSORS

=head2 subscriber_id

  data_type: 'integer'
  is_nullable: 0

=head2 registration_status

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 last_registration

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 expiry

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 last_code

  data_type: 'smallint'
  is_nullable: 1

=head2 last_reason

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 contacts

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head1 PRIMARY KEY

=over 4

=item * L</subscriber_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:keH+HF16e8LQPC4Up/54Tg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
