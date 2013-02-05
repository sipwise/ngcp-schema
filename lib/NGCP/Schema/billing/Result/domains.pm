package NGCP::Schema::billing::Result::domains;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->table("domains");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 127 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("domain_idx", ["domain"]);


__PACKAGE__->has_many(
  "domain_resellers",
  "NGCP::Schema::billing::Result::domain_resellers",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "voip_subscribers",
  "NGCP::Schema::billing::Result::voip_subscribers",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::domains

=head1 TABLE: C<domains>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 127

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<domain_idx>

=over 4

=item * L</domain>

=back

=head1 RELATIONS

=head2 domain_resellers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::domain_resellers>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::billing::Result::voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-05 17:12:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1bv/Q+wYBvYf4y6zE6YRqg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
