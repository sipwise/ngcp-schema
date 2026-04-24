package NGCP::Schema::ResultSet 2.007;

use v5.40;

use parent 'DBIx::Class::ResultSet';


__PACKAGE__->load_components(
   'Helper::ResultSet::IgnoreWantarray',
   'Helper::ResultSet::SetOperations',
   );

1;
