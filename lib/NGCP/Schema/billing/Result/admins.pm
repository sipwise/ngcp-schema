package NGCP::Schema::billing::Result::admins;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "EncodedColumn");


__PACKAGE__->table("admins");


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
  "lawful_intercept",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("login_idx", ["login"]);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::billing::Result::resellers",
  { id => "reseller_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::admins

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<admins>

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<login_idx>

=over 4

=item * L</login>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::resellers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6atsBdT63ZmQFnX0f9db3Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
