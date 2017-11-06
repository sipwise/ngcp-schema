package NGCP::Schema::Result::xmlhosts;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.xmlhosts");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 15 },
  "port",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "path",
  { data_type => "varchar", default_value => "/", is_nullable => 0, size => 64 },
  "sip_port",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "xmlhostgroups",
  "NGCP::Schema::Result::xmlhostgroups",
  { "foreign.host_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

NGCP::Schema::Result::xmlhosts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.xmlhosts>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 15

=head2 port

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 path

  data_type: 'varchar'
  default_value: '/'
  is_nullable: 0
  size: 64

=head2 sip_port

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 description

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 xmlhostgroups

Type: has_many

Related object: L<NGCP::Schema::Result::xmlhostgroups>
