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
  "parent_chain",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 1024,
  },
);

__PACKAGE__->set_primary_key("id");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<'SQL');
WITH RECURSIVE cte as (
    SELECT id, name,
           JSON_ARRAY(id) AS parent_chain
      FROM voip_sound_sets
     WHERE id = ?
    UNION ALL
    SELECT s.id, s.name,
           JSON_ARRAY_INSERT(cte.parent_chain, "$[0]", s.id) AS parent_chain
      FROM voip_sound_sets s
      JOIN cte ON cte.id = s.parent_id
)
SELECT cte.id, cte.name,
       REPLACE(REPLACE(REPLACE(
          JSON_REMOVE(cte.parent_chain, "$[0]"),
          "[", ""), "]", ""), ", ", ":"
       ) AS parent_chain
  FROM cte
SQL

1;

