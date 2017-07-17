package NGCP::Schema::Result::voip_number_blocks;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.voip_number_blocks");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "cc",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ac",
  { data_type => "varchar", is_nullable => 0, size => 7 },
  "sn_prefix",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "sn_length",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "allocable",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "authoritative",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("prefix_idx", ["cc", "ac", "sn_prefix"]);

__PACKAGE__->has_many(
  "voip_number_block_resellers",
  "NGCP::Schema::Result::voip_number_block_resellers",
  { "foreign.number_block_id" => "self.id" },
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

NGCP::Schema::Result::voip_number_blocks

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.voip_number_blocks>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 cc

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ac

  data_type: 'varchar'
  is_nullable: 0
  size: 7

=head2 sn_prefix

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 sn_length

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 allocable

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 authoritative

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<prefix_idx>

=over 4

=item * L</cc>

=item * L</ac>

=item * L</sn_prefix>

=back

=head1 RELATIONS

=head2 voip_number_block_resellers

Type: has_many

Related object: L<NGCP::Schema::Result::voip_number_block_resellers>