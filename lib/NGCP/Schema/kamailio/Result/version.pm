package NGCP::Schema::kamailio::Result::version;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("version");


__PACKAGE__->add_columns(
  "table_name",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "table_version",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::version

=head1 TABLE: C<version>

=head1 ACCESSORS

=head2 table_name

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 table_version

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ik4XhnYDwdu1IKOgE9duYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
