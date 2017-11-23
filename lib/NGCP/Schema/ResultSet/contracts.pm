package NGCP::Schema::ResultSet::contracts;

use parent 'NGCP::Schema::ResultSet';

sub billing_mappings_actual {
    my ($rs, $start_date, $end_date) = @_;
    $start_date //= 'NOW()';
    $end_date //= 'NOW()';

    my $alias = $rs->{attrs}{alias};
    my $bm_rs = $rs->result_source->schema->resultset('billing_mappings');

    my $max_q = $bm_rs->search({
        'bm.start_date' => { 
            '<=>' => $bm_rs->search({
                -and => [
                    -or  => [ 'bmm.start_date' => undef,
                              'bmm.start_date' => { '<=' => "$start_date" } ],
                    -or  => [ 'bmm.end_date' => undef,
                              'bmm.end_date' => { '>=' => "$end_date" } ],
                    'bmm.contract_id' => 'bm.contract_id',
                ],
            },{
                select => [ { max => 'bmm.start_date', -as => 'effective_start_date' } ],
                alias => 'bmm',
            })->as_query,
        }
    },{
        collapse => 1,
        select => [ qw(id contract_id) ],
        alias => 'bm',
    })->as_query;

    return $rs->search(undef,
    {
        from => [ 
            { $alias => $rs->result_source->from() },
            [
                { 'bm' => $max_q , -join_type => 'inner' },
                # we cannot join billing_mappings.start_date here
                # because it always goes after this join
                # therefore, it is joined by the contract_id 
                { "bm.contract_id" => { -ident => "${alias}.id" } }, 
            ],
        ],
        # late join in WHERE on the INNER JOIN table is processed identically by the optimiser
        # as if it were specified in the ON join condition but solves the join order problem
        where => { 
            'bm.id' => { -ident => 'billing_mappings.id' },
        },
    });
}

1;
