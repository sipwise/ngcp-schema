#!/usr/bin/perl -w
#
#
#
use strict;
use NGCP::Schema;
use Data::Dumper;
use Time::HiRes qw(gettimeofday tv_interval);
use NGCP::Panel::Utils::DateTime;

my $schema = NGCP::Schema->connect;

my $contract_id = 5; # set your own one perhaps :)
my $now //= NGCP::Panel::Utils::DateTime::current_local;
my $dtf = $schema->storage->datetime_parser;

# contracts -> actual billing mappings
my $stime = [gettimeofday];
my $rs = $schema->resultset('contracts')->billing_mappings_actual # accepts $start_date, $end_date args
                                                                  # ( $dtf->format_datetime($now) ) x 2) = equal result
        ->search({
            'me.status' => { '!=' => 'terminated' },
            'me.id' => $contract_id,
        },{
            'join' => 'billing_mappings',
            '+select' => [
                'billing_mappings.id',
                'billing_mappings.start_date',
                'billing_mappings.product_id',
            ],
            '+as' => [
                'billing_mapping_id',
                'billing_mapping_start_date',
                'product_id',
            ],
            alias => 'me',
        });

printf "contract_id: %d\n", $rs->first->id;

print "Exec: ". tv_interval($stime),"\n";

# billing_mappings -> actual billing mappings
$stime = [gettimeofday];
$rs = $schema->resultset('billing_mappings')->actual # accepts $start_date, $end_date args
 #                                                   # ( $dtf->format_datetime($now) ) x 2) = equal result
        ->search({
        },{
        });

printf "actual billing_mappings count: %d\n", $rs->count;

print "Exec: ". tv_interval($stime),"\n";

exit 0;
