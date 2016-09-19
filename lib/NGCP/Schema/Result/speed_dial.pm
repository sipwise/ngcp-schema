package NGCP::Schema::Result::speed_dial;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.speed_dial");


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
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "sd_username",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "sd_domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "new_uri",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "fname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "lname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "description",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint(
  "speed_dial_idx",
  ["username", "domain", "sd_domain", "sd_username"],
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::speed_dial

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<speed_dial>

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
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 sd_username

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 sd_domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 new_uri

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 fname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 lname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 description

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<speed_dial_idx>

=over 4

=item * L</username>

=item * L</domain>

=item * L</sd_domain>

=item * L</sd_username>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wvfgqyk/uXiexkpD/GubBA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
