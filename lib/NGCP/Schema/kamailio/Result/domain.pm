package NGCP::Schema::kamailio::Result::domain;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("domain");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "last_modified",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "1900-01-01 00:00:01",
    is_nullable => 0,
  },
  "did",
  { data_type => "varchar", is_nullable => 1, size => 64 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("domain_idx", ["domain"]);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::domain

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<domain>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 last_modified

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '1900-01-01 00:00:01'
  is_nullable: 0

=head2 did

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<domain_idx>

=over 4

=item * L</domain>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yfZp8jZ7umFdhbCtVLVmHA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
