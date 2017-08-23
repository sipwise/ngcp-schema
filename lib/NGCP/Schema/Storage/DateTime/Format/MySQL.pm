package NGCP::Schema::Storage::DateTime::Format::MySQL;

use strict;

use vars qw ($VERSION);

$VERSION = '0.06';

use base ("DateTime::Format::MySQL");

sub format_time
{
    my ( $self, $dt ) = @_;
    die('blah');
    return $dt->hms(':');
}


1;
