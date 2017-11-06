package NGCP::Schema::Result::admins;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON", "EncodedColumn");

__PACKAGE__->table("billing.admins");

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
  "login",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "md5pass",
  {
    data_type => "char",
    is_nullable => 1,
    size => 32,
    encode_column => 1,
    encode_class  => 'Digest',
    encode_args   => {algorithm => 'MD5', format => 'hex'},
    encode_check_method => 'check_password',
  },
  "saltedpass",
  { data_type => "char", size => 54, is_nullable => 1 },
  "is_master",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "is_superuser",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "is_active",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "read_only",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "show_passwords",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "call_data",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "billing_data",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "lawful_intercept",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "ssl_client_m_serial",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ssl_client_certificate",
  { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("login_idx", ["login"]);

__PACKAGE__->add_unique_constraint("ssl_client_m_serial_UNIQUE", ["ssl_client_m_serial"]);

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

NGCP::Schema::Result::admins

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.admins>

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

=head2 login

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 md5pass

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 is_master

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 is_superuser

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 is_active

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 read_only

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 show_passwords

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 call_data

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 lawful_intercept

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 ssl_client_m_serial

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<login_idx>

=over 4

=item * L</login>

=back

=head2 C<ssl_client_m_serial_UNIQUE>

=over 4

=item * L</ssl_client_m_serial>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::resellers>
