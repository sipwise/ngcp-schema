package NGCP::Schema::Result::timezones;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "+NGCP::Schema::InflateColumn::DateTime::WithTZ",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("timezones");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "name",
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

my $timezones_sql = 'SELECT @rc:=@rc+1 as id, t.name FROM (' .
                    (join " UNION ALL ",
                        map { sprintf "SELECT '%s' as name", $_ }
                            DateTime::TimeZone->all_names) .
                    ') t, (SELECT @rc:=0) as cnt';

__PACKAGE__->set_primary_key("name");

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition($timezones_sql);

1;

