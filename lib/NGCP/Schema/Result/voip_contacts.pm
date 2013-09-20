package NGCP::Schema::Result::voip_contacts;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_contacts");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 127 },
  "phonenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "homephonenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "mobilenumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "faxnumber",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "homepage",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_contacts

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_contacts>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 company

  data_type: 'varchar'
  is_nullable: 1
  size: 127

=head2 phonenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 homephonenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 mobilenumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 faxnumber

  data_type: 'varchar'
  is_nullable: 1
  size: 31

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 homepage

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rk0pvQYvbcvdA7WdVPphCQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
