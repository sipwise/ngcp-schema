package NGCP::Schema::Result::voip_subscriber_aliases_csv;
use Scalar::Util qw(blessed);
use base qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "Helper::Row::ToJSON",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("voip_subscriber_aliases_csv");


__PACKAGE__->add_columns(
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "aiases",
  {
    data_type => "varchar", default_value => "", is_nullable => 0, size => 1024 },
);
__PACKAGE__->belongs_to(
  "voip_subscribers",
  "NGCP::Schema::Result::voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->set_primary_key("subscriber_id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition("
select subscriber_id, group_concat(concat(cc,ac,sn)) as aliases from billing.voip_numbers group by subscriber_id
");

1;

