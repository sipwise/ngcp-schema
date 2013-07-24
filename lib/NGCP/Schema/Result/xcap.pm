package NGCP::Schema::Result::xcap;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.xcap");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "doc",
  { data_type => "mediumblob", is_nullable => 0 },
  "doc_type",
  { data_type => "integer", is_nullable => 0 },
  "etag",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "source",
  { data_type => "integer", is_nullable => 0 },
  "doc_uri",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "port",
  { data_type => "integer", is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("doc_uri_idx", ["doc_uri"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::xcap

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.xcap>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 doc

  data_type: 'mediumblob'
  is_nullable: 0

=head2 doc_type

  data_type: 'integer'
  is_nullable: 0

=head2 etag

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 source

  data_type: 'integer'
  is_nullable: 0

=head2 doc_uri

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 port

  data_type: 'integer'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<doc_uri_idx>

=over 4

=item * L</doc_uri>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h1i8myXfqHQYuKAGjzkWSw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
