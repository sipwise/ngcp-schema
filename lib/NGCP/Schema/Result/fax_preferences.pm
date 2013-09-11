package NGCP::Schema::Result::fax_preferences;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.005';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.fax_preferences");


__PACKAGE__->add_columns(
  "subscriber_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "active",
  {
    data_type => "enum",
    default_value => "true",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_status",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_copy",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
  "send_copy_cc",
  {
    data_type => "enum",
    default_value => "false",
    extra => { list => ["true", "false"] },
    is_nullable => 0,
  },
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

NGCP::Schema::Result::fax_preferences

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.fax_preferences>

=head1 ACCESSORS

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 active

  data_type: 'enum'
  default_value: 'true'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_status

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_copy

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head2 send_copy_cc

  data_type: 'enum'
  default_value: 'false'
  extra: {list => ["true","false"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</subscriber_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uAuDAVv+/jziv3khAD57Jg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
