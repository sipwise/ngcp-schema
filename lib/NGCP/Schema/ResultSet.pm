package NGCP::Schema::ResultSet;
use Sipwise::Base;
extends 'DBIx::Class::ResultSet';

our $VERSION = '2.001';

__PACKAGE__->load_components('Helper::ResultSet');
