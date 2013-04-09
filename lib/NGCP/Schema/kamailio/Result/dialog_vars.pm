package NGCP::Schema::kamailio::Result::dialog_vars;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("dialog_vars");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "hash_entry",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hash_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "dialog_key",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "dialog_value",
  { data_type => "varchar", is_nullable => 0, size => 512 },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::dialog_vars

=head1 TABLE: C<dialog_vars>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 hash_entry

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hash_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 dialog_key

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 dialog_value

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hbl72Rr/gXItiYlp1ekKGw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
