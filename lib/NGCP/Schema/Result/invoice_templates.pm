package NGCP::Schema::Result::invoice_templates;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.009';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.invoice_templates");


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
    is_nullable => 0,
  },
  "type",
  {
    data_type => "enum",
    default_value => "svg",
    extra => { list => ["svg", "html"] },
    is_nullable => 0,
  },
  "is_active",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "base64_saved",
  { data_type => "mediumblob", is_nullable => 1 },
  "base64_previewed",
  { data_type => "mediumblob", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "x_title",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "y_title",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "rows_title",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "x_mid",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "y_mid",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "rows_mid",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "x_last",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "y_last",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
  "rows_last",
  { data_type => "mediumint", default_value => 0, is_nullable => 0 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->has_many(
  "invoice_template_resources",
  "NGCP::Schema::billing::Result::invoice_template_resources",
  { "foreign.invoice_template_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::contacts",
  { id => "reseller_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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

NGCP::Schema::Result::invoice_templates

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<invoice_templates>

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
  is_nullable: 0

=head2 type

  data_type: 'enum'
  default_value: 'svg'
  extra: {list => ["svg","html"]}
  is_nullable: 0

=head2 is_active

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 base64_saved

  data_type: 'mediumblob'
  is_nullable: 1

=head2 base64_previewed

  data_type: 'mediumblob'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 reseller

Type: belongs_to

Related object: L<NGCP::Schema::Result::contacts>

=cut


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
