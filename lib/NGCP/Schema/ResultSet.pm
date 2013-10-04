package NGCP::Schema::ResultSet;
use Sipwise::Base;
extends 'DBIx::Class::ResultSet';

our $VERSION = '2.006';

__PACKAGE__->load_components('Helper::ResultSet::SetOperations');

