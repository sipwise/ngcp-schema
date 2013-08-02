package NGCP::Schema::Result::silo;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.003';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.silo");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "src_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "dst_addr",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "inc_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "exp_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "snd_time",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "ctype",
  {
    data_type => "varchar",
    default_value => "text/plain",
    is_nullable => 0,
    size => 32,
  },
  "body",
  { data_type => "blob", is_nullable => 0 },
  "extra_hdrs",
  { data_type => "text", is_nullable => 0 },
  "callid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "status",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
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

NGCP::Schema::Result::silo

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.silo>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 src_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 dst_addr

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 inc_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 exp_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 snd_time

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 ctype

  data_type: 'varchar'
  default_value: 'text/plain'
  is_nullable: 0
  size: 32

=head2 body

  data_type: 'blob'
  is_nullable: 0

=head2 extra_hdrs

  data_type: 'text'
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 status

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1YSmqYtHyiP9lYfL0mAFHg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
