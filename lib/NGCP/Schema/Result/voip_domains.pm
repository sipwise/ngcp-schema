package NGCP::Schema::Result::voip_domains;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_domains");

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
  "voip_dbaliases",
  "NGCP::Schema::Result::voip_dbaliases",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_dom_preferences",
  "NGCP::Schema::Result::voip_dom_preferences",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "provisioning_voip_subscribers",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { "foreign.domain_id" => "self.id" },
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

NGCP::Schema::Result::voip_domains

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_domains>

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

=head2 voip_dbaliases

Type: has_many

Related object: L<NGCP::Schema::Result::voip_dbaliases>

=head2 voip_dom_preferences

Type: has_many

Related object: L<NGCP::Schema::Result::voip_dom_preferences>

=head2 provisioning_voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>
