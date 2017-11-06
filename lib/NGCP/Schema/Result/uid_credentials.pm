package NGCP::Schema::Result::uid_credentials;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("kamailio.uid_credentials");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "auth_username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "did",
  {
    data_type => "varchar",
    default_value => "_default",
    is_nullable => 0,
    size => 64,
  },
  "realm",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "password",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 28 },
  "flags",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ha1",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "ha1b",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "uid",
  { data_type => "varchar", is_nullable => 0, size => 64 },
);

__PACKAGE__->set_primary_key("id");

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

NGCP::Schema::Result::uid_credentials

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.uid_credentials>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 auth_username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 did

  data_type: 'varchar'
  default_value: '_default'
  is_nullable: 0
  size: 64

=head2 realm

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 password

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 28

=head2 flags

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ha1

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 ha1b

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 uid

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
