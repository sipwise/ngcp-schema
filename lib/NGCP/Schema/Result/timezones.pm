package NGCP::Schema::Result::timezones;
use Scalar::Util qw(blessed);
use base qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("timezones");


__PACKAGE__->add_columns(
  "timezone",
  {
    data_type => "varchar",
    size      => 80,
    is_nullable => 0,
  },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

my $timezones_sql = join " UNION ALL ",
                        map { sprintf "SELECT '%s' as timezone", $_ }
                            DateTime::TimeZone->all_names;

__PACKAGE__->set_primary_key("timezone");

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition($timezones_sql);

1;

