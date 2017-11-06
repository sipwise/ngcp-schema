package NGCP::Schema::Result::domains;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.domains");

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
  "NGCP::Schema::Result::domain_resellers",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "voip_subscribers",
  "NGCP::Schema::Result::voip_subscribers",
  { "foreign.domain_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

#__PACKAGE__->has_many(
#  "call_list_suppressions",
#  "NGCP::Schema::Result::call_list_suppressions",
#  { "foreign.domain_id" => "self.id" },
#  { cascade_copy => 0, cascade_delete => 0 },
#);

__PACKAGE__->has_one(
  "provisioning_voip_domain",
  "NGCP::Schema::Result::voip_domains",
  { "foreign.domain" => "self.domain" },
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

NGCP::Schema::Result::domains

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.domains>

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

Related object: L<NGCP::Schema::Result::domain_resellers>

=head2 voip_subscribers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_subscribers>
