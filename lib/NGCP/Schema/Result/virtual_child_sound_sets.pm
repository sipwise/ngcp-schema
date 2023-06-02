package NGCP::Schema::Result::virtual_child_sound_sets;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("virtual_child_sound_sets");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 256,
  },
);

__PACKAGE__->set_primary_key("id");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<'SQL');
WITH RECURSIVE cte as (
    SELECT id, name
      FROM voip_sound_sets
     WHERE id = ?
    UNION ALL
    SELECT s.id, s.name
      FROM voip_sound_sets s
      JOIN cte ON cte.id = s.parent_id
)
SELECT cte.id, cte.name
  FROM cte
SQL

1;

