package NGCP::Schema::Result::lnp_providers;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.lnp_providers");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "prefix",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "authoritative",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "skip_rewrite",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->has_many(
  "lnp_numbers",
  "NGCP::Schema::Result::lnp_numbers",
  { "foreign.lnp_provider_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->has_many(
  "ncos_lnp_lists",
  "NGCP::Schema::Result::ncos_lnp_list",
  { "foreign.lnp_provider_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::lnp_providers

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<lnp_providers>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 prefix

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 authoritative

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 skip_rewrite

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 lnp_numbers

Type: has_many

Related object: L<NGCP::Schema::Result::lnp_numbers>

=head2 ncos_lnp_lists

Type: has_many

Related object: L<NGCP::Schema::Result::ncos_lnp_list>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T4iZuW2BZCL/dgctESvKTw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
