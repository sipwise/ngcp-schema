package NGCP::Schema::ResultSet;

use Sipwise::Base '-skip'=>['TryCatch'];
use parent 'DBIx::Class::ResultSet';

our $VERSION = '2.007';

__PACKAGE__->load_components(
   'Helper::ResultSet::IgnoreWantarray',
   'Helper::ResultSet::SetOperations',
   );

1;
