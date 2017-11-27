package NGCP::Schema::ResultSet::billing_mappings;

use parent 'NGCP::Schema::ResultSet';

sub actual {
    my ($rs, $start_date, $end_date) = @_;
    $start_date //= 'NOW()';
    $end_date //= 'NOW()';

    return $rs->search({
        'me.start_date' => {
            '<=>' => $rs->search(
                { 'bmm.contract_id' => { -ident => 'me.contract_id' },
                  '-and' => [
                    -or => [ 'bmm.start_date' => undef,
                             'bmm.start_date' => { '<=' => "$start_date" } ],
                    -or => [ 'bmm.end_date' => undef,
                             'bmm.end_date' => { '>=' => "$end_date" } ],
                  ]
                },
                { alias => 'bmm' }
            )->get_column('start_date')->max_rs->as_query,
        },
    });
}

1;
