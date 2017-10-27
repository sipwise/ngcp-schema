package NGCP::Schema::Result::location;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("kamailio.location");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "contact",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "received",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 512 },
  "expires",
  {
    data_type => "bigint",
    extra => { unsigned => 1 }
    default_value => 0,
    is_nullable => 0,
    inflate_datetime => 'epoch_milli',
  },
  "q",
  {
    data_type => "float",
    default_value => "1.00",
    is_nullable => 0,
    size => [10, 2],
  },
  "callid",
  {
    data_type => "varchar",
    default_value => "Default-Call-ID",
    is_nullable => 0,
    size => 255,
  },
  "cseq",
  { data_type => "integer", default_value => 13, is_nullable => 0 },
  "last_modified",
  {
    data_type => "bigint",
    extra => { unsigned => 1 }
    default_value => 0,
    is_nullable => 0,
    inflate_datetime => 'epoch_milli',
  },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "cflags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "user_agent",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "socket",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "methods",
  { data_type => "integer", is_nullable => 1 },
  "ruid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "reg_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "instance",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("ruid_idx", ["ruid"]);

# handle with care, you need to join them together yourself, like:
# { 'domain.id' => { -ident => 'subscriber.domain_id' } },
# { join => [ 'subscriber', 'domain' ] }
__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { "foreign.username" => "self.username" },
);
__PACKAGE__->belongs_to(
  "domain",
  "NGCP::Schema::Result::voip_domains",
  { "foreign.domain" => "self.domain" },
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

NGCP::Schema::Result::location

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.location>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 contact

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 received

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=head2 expires

  data_type: 'bigint'
  extra: {unsigned: 1}
  default_value: 0
  is_nullable: 0

=head2 q

  data_type: 'float'
  default_value: 1.00
  is_nullable: 0
  size: [10,2]

=head2 callid

  data_type: 'varchar'
  default_value: 'Default-Call-ID'
  is_nullable: 0
  size: 255

=head2 cseq

  data_type: 'integer'
  default_value: 13
  is_nullable: 0

=head2 last_modified

  data_type: 'bigint'
  extra: {unsigned: 1}
  default_value: 0
  is_nullable: 0

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 cflags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 user_agent

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 socket

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 methods

  data_type: 'integer'
  is_nullable: 1

=head2 ruid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 reg_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 instance

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<ruid_idx>

=over 4

=item * L</ruid>

=back
