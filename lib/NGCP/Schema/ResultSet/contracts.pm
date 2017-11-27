package NGCP::Schema::ResultSet::contracts;

use parent 'NGCP::Schema::ResultSet';

sub billing_mappings_actual {
    my ($rs, $start_date, $end_date) = @_;
    $start_date //= 'NOW()';
    $end_date //= 'NOW()';

    return $rs->search({
        'billing_mappings.start_date' => {
            '<=>' => $rs->result_source->schema->resultset('billing_mappings')->search(
                { 'bmm.contract_id' => { -ident => 'billing_mappings.contract_id' },
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
