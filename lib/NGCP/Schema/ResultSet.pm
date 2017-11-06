package NGCP::Schema::ResultSet;

use strict;
use warnings;

use Sipwise::Base;
use parent 'DBIx::Class::ResultSet';

our $VERSION = '2.007';

__PACKAGE__->load_components(
   'Helper::ResultSet::IgnoreWantarray',
   'Helper::ResultSet::SetOperations',
   );

1;
