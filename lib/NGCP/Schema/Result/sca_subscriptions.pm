package NGCP::Schema::Result::sca_subscriptions;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.sca_subscriptions");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "aor",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "event",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "expires",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "state",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "app_idx",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "from_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "to_tag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "record_route",
  { data_type => "text", is_nullable => 1 },
  "notify_cseq",
  { data_type => "integer", is_nullable => 0 },
  "subscribe_cseq",
  { data_type => "integer", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint(
  "sca_subscriptions_idx",
  ["subscriber", "call_id", "from_tag", "to_tag"],
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::sca_subscriptions

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.sca_subscriptions>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 aor

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 event

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 expires

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 state

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 app_idx

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 from_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 to_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 record_route

  data_type: 'text'
  is_nullable: 1

=head2 notify_cseq

  data_type: 'integer'
  is_nullable: 0

=head2 subscribe_cseq

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<sca_subscriptions_idx>

=over 4

=item * L</subscriber>

=item * L</call_id>

=item * L</from_tag>

=item * L</to_tag>

=back
