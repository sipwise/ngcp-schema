package NGCP::Schema::Result::acc_cdrs;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.acc_cdrs");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "start_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "2000-01-01 00:00:00",
    is_nullable => 0,
  },
  "end_time",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "2000-01-01 00:00:00",
    is_nullable => 0,
  },
  "duration",
  {
    data_type => "float",
    default_value => "0.000",
    is_nullable => 0,
    size => [10, 3],
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

NGCP::Schema::Result::acc_cdrs

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<acc_cdrs>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 start_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '2000-01-01 00:00:00'
  is_nullable: 0

=head2 end_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '2000-01-01 00:00:00'
  is_nullable: 0

=head2 duration

  data_type: 'float'
  default_value: 0.000
  is_nullable: 0
  size: [10,3]

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GvxZhtJooAcmBYBwvmiNng


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
