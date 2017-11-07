#!/usr/bin/perl

BEGIN {
    unshift(@INC,'../lib');   
};

use strict;
#use warnings;
use NGCP::Schema;
#use Storable;
use Getopt::Long;
use File::Basename qw(fileparse);

my $filename = 'ngcp_schema.pdf';
my $related_entity_depth = 1;
my $show_forward_relations = 1;
my $show_backward_relations = 1;
my $verbose = 0;
my $layout = 'dot';
my @limit_databases = qw//; #qw/provisioning/;
my @limit_entities = qw//; #qw/billing.billing_mappings/; #qw/billing.contracts/; #qw/billing.billing_mappings/; #qw/billing.email_templates/; #qw/billing.contracts/;

GetOptions ("depth=i" => \$related_entity_depth,
             "file=s"   => \$filename,
             "layout=s"   => \$layout,
             "verbose"  => \$verbose,
             "entities=s" => sub {
                my ($opt_name, $opt_value) = @_;
                @limit_entities = split(/[ ,;]+/,$opt_value);
            },
             "databases=s" => sub {
                my ($opt_name, $opt_value) = @_;
                @limit_databases = split(/[ ,;]+/,$opt_value);
            }) or die("error in command line arguments\n");

my ($fname,$fpath,$fsuffix) = fileparse($filename,qr/\.[^.]*/);
my $dot_filename = $fpath . $fname . '.dot';
my $output_filename = $fpath . $fname . $fsuffix;
my $ext = $fsuffix;
$ext =~ s/^\.//;

my %databases_of_interest = map { $_ => 1 } @limit_databases;
my %entities_of_interest = map { $_ => 1 } @limit_entities;

my %db_colors = ('' => 'white',
                 provisioning => '#FACCC8',
                 carrier => '#FAEDC8',
                 ngcp => '#ECFAC8',
                 kamailio => '#C8FAF1',
                 sipstats => '#C8E0FA',
                 accounting => '#D8C8FA',
                 billing => '#FAC8F6');
my $table_color = '#F5F5F5';
my $view_color = '#B0B0B0';
my $datatype_color = '#3B3B3B';
my $extra_color = 'gray';
my $column_color = 'red';
my $relation_color = 'blue';
my $edge_color = 'black';

my $self_port_position = ''; #'w';
my $foreign_port_position = ''; #'w'; 

my $entities = {};
my $all_entities = {}; 
my $relations = [];
my $forward_relations = {};
my $backward_relations = {};

_load_model();
_write_dot();
exit(_create_output());

sub _load_model {
    my $all_databases = {};
    my @all_relations = ();
    foreach my $src_name (sort NGCP::Schema->sources) {
        my $source = NGCP::Schema->source($src_name);
        my $entity = {};
        $entity->{name} = $source->result_class;
        $entity->{title} = $source->name;
        $entity->{node} = $source->name;
        $entity->{node} =~ s/\./_/;
        ($entity->{table},$entity->{database}) = reverse split(/\./,$source->name,2);
        $entity->{stereotype} = ref $source;
        
        my %primary_cols = map { $_ => 1 } $source->primary_columns;
        my @columns = ();
        foreach my $col_name ($source->columns) {
            my $col_info = $source->column_info($col_name);
            $col_info->{pk} = (exists $primary_cols{$col_name} ? 1 : 0);
            $col_info->{name} = $col_name;
            push(@columns,$col_info);
        }
        $entity->{columns} = \@columns;
        
        my @rels = ();
        foreach my $rel_name ($source->relationships) {
            my $rel_info = $source->relationship_info($rel_name);
            my $cond = $rel_info->{cond};
            if (ref $cond eq 'CODE') {
                $cond = &$cond({foreign_alias => 'foreign', self_alias => 'self'});
            }
            my @self_columns = ();
            my @foreign_columns = ();
            foreach my $foreign (sort keys %$cond) {
                my $self = $cond->{$foreign};
                if (ref $self eq 'HASH') {
                    push(@self_columns,values %$self);
                } else {
                    push(@self_columns,$self);
                }
                push(@foreign_columns,$foreign);
            }
            @self_columns = map {
                    if (m/^self\./) {
                        s/^self\.//r;
                    } else {
                        '\'' . $_ . '\'';
                    }
                } @self_columns;
            @foreign_columns = map {
                    if (m/^foreign\./) {
                        s/^foreign\.//r;
                    } else {
                        '\'' . $_ . '\'';
                    }
                } @foreign_columns;
            my $multi = $rel_info->{attrs}->{accessor};
            if ('multi' eq $multi) {
                $multi = '*';
            } elsif ('single' eq $multi) {
                $multi = '1';
            } elsif ('filter' eq $multi) {
                $multi = '?';
            }
            my $relation = {
                self_entity => $entity->{name},
                self_column => $self_columns[0],
                self_columns => ((scalar @self_columns) > 1 ? join(', ',@self_columns) : undef),
                foreign_entity => $rel_info->{class},
                foreign_column => $foreign_columns[0],
                foreign_columns => ((scalar @foreign_columns) > 1 ? join(', ',@foreign_columns) : undef),
                name => $rel_name,
                multi => $multi,
            };
            push(@all_relations,$relation);
            push(@rels,$relation);
            if (not exists $forward_relations->{$relation->{self_entity}}) {
                $forward_relations->{$relation->{self_entity}} = [];
            }
            push(@{$forward_relations->{$relation->{self_entity}}},$relation->{foreign_entity});
            #foreach my $col (@self_columns) {
            #    $forward_relations->{$relation->{self_entity}}->{$col} += 1;
            #}
            if (not exists $backward_relations->{$relation->{foreign_entity}}) {
                $backward_relations->{$relation->{foreign_entity}} = [];
            }
            push(@{$backward_relations->{$relation->{foreign_entity}}},$relation->{self_entity});
            #foreach my $col (@foreign_columns) {
            #    $backward_relations->{$relation->{foreign_entity}}->{$col} += 1;
            #}           
        }
        $entity->{relations} = \@rels;
        
        if (not exists $all_entities->{$entity->{name}}) {
            $all_entities->{$entity->{name}} = $entity;
            if (not exists $all_databases->{$entity->{database}}) {
                $all_databases->{$entity->{database}} = {};
            }
            $all_databases->{$entity->{database}}->{$entity->{name}} = $entity;
        } else {
            die('duplicate entity "' . $entity->{name} . "\"\n");
        }
    }
    if ((scalar keys %entities_of_interest) > 0) {
        foreach my $ent_title (keys %entities_of_interest) {
            my $title_ok = 0;
            foreach my $ent_name (keys %$all_entities) {
                my $entity = $all_entities->{$ent_name};
                if ($ent_title eq $entity->{title}) {
                    $title_ok = 1;
                    last;
                }
            }
            die('unknown entity "' . $ent_title . "\"\n") if not $title_ok;
        }
        _log(sprintf('limit to entities: %s',join(', ',sort keys %entities_of_interest)));
        _log(sprintf('relation depth: %d',$related_entity_depth));
        _log('no forward relations') if not $show_forward_relations;
        _log('no backward relations') if not $show_backward_relations;
        _get_related_entities($all_entities,\%entities_of_interest,$entities,$relations,$related_entity_depth);
    } else {
        %$entities = %$all_entities;
        $relations = \@all_relations;
    }
    if ((scalar keys %databases_of_interest) > 0) {
        foreach my $database (keys %databases_of_interest) {
            die('unknown database "' . $database . "\"\n") if not exists $all_databases->{$database};
        }
        _log(sprintf('limit to databases: %s',join(', ',sort keys %databases_of_interest)));
        foreach my $ent_name (keys %$entities) {
            my $entity = $entities->{$ent_name};
            if (length($entity->{database}) > 0 and not exists $databases_of_interest{$entity->{database}}) {
                delete $entities->{$ent_name};
            }
        }
    }
    _log(sprintf('%d of %d entities prepared: %s',scalar keys %$entities,scalar keys %$all_entities,join(', ',sort map { $all_entities->{$_}->{title} } keys %$entities)));
    _check_relations();
    _log(sprintf('%d of %d relations prepared: %s',scalar @$relations,scalar @all_relations,join(', ',sort map { $all_entities->{$_->{self_entity}}->{title} . '.' . $_->{name} } @$relations)));
}
    
sub _get_related_entities {
    my ($all_entities,$eoi,$related_entities_of_interest,$relations_of_interest,$depth) = @_;
    if ($depth >= 0) {
        my %related_eoi = ();
        foreach my $ent_name (keys %$all_entities) {
            my $entity = $all_entities->{$ent_name};
            if (exists $eoi->{$entity->{title}}) {
                if (not exists $related_entities_of_interest->{$ent_name}) {
                    $related_entities_of_interest->{$ent_name} = $entity;
                    push(@$relations_of_interest,@{$entity->{relations}});
                }
                #foreach my $rel (@{ $entity->{relations} }) {
                #    $related_eoi{$all_entities->{$rel->{foreign_entity}}->{title}} = 1;
                #}
                if ($show_forward_relations) {
                    foreach my $to_name (@{$forward_relations->{$ent_name}}) {
                        $related_eoi{$all_entities->{$to_name}->{title}} = 1;
                    }
                }
                if ($show_backward_relations) {
                    foreach my $from_name (@{$backward_relations->{$ent_name}}) {
                        $related_eoi{$all_entities->{$from_name}->{title}} = 1;
                    }                
                }
            }
        }
        _get_related_entities($all_entities,\%related_eoi,$related_entities_of_interest,$relations_of_interest,$depth - 1);
    }
}

sub _check_relations {
    my @checked_relations = ();
    foreach my $rel (@$relations) {
        if (not exists $all_entities->{$rel->{foreign_entity}}) {
            warn('unknown entity "' . $rel->{foreign_entity} . "\"\n");
        } else {
            if (exists $entities->{$rel->{foreign_entity}}
                and exists $entities->{$rel->{self_entity}}
                ) {
                push(@checked_relations,$rel);
            }
        }
    }
    $relations = \@checked_relations;
    foreach my $ent_name (keys %$entities) {
        my $entity = $entities->{$ent_name};
        my @checked_entity_relations = ();
        foreach my $rel (@{$entity->{relations}}) {
            if (exists $all_entities->{$rel->{foreign_entity}}) {
                push(@checked_entity_relations,$rel);
            }
        }
        $entity->{relations} = \@checked_entity_relations;
    }
}

sub _write_dot {
    open my $dot_fh, '>', $dot_filename or die($! . "\n");
    my @title_labels = (NGCP::Schema->meta->{package} . ' ' . NGCP::Schema->schema_version . ' (' . localtime . ')');
    if ((scalar keys %entities_of_interest) > 0) {
        push(@title_labels,'Entities: ' . join(', ',keys %entities_of_interest));
        push(@title_labels,'Relations: depth=' . $related_entity_depth . ($show_forward_relations ? '' : ', no forward relations') . ($show_backward_relations ? '' : ', no backward relations'));
    }
    if ((scalar keys %databases_of_interest) > 0) {
        push(@title_labels,'Databases: ' . join(', ',keys %databases_of_interest));
    }
    my $diagram_title = join("\\n",@title_labels);
    my $fontsize = scalar keys %$entities;
    $fontsize = ($fontsize > 20 ? 60 : ($fontsize > 10 ? 40 : ($fontsize > 5 ? 32 : 24)));
    print { $dot_fh } <<PREAMBLE;
digraph schema {

  labelloc=top;
  labeljust=center;
  fontsize=$fontsize;
  label="$diagram_title";
    
  node [shape=record, style="filled"];
  edge [arrowsize=1.4 color="$edge_color"];
  ranksep=0.5;
  nodesep=0.5;
  overlap=false;
  ratio=0.707;
  size=12;
  splines=true;
  
  rank="same";
  rankdir="LR";

PREAMBLE
    
    my $indent = '  ';
    foreach my $ent_name (sort keys %$entities) {
        my $entity = $entities->{$ent_name};
        my $node_color;
        if ('DBIx::Class::ResultSource::Table' eq $entity->{stereotype}) {
            $node_color = $table_color;
        } elsif ('DBIx::Class::ResultSource::View' eq $entity->{stereotype}) {
            $node_color = $view_color;
        }
        my $db_color = $db_colors{$entity->{database}};
        my $columns = '';
        foreach my $column (@{$entity->{columns}}) {
            $columns .= '<tr><td port="' . $column->{name} . '" align="left" bgcolor="' . $node_color . '">' .
                '<font color="' . $datatype_color . '">' . $column->{data_type} . (exists $column->{size} ? ' (' . (ref $column->{size} eq 'ARRAY' ? join(', ',@{$column->{size}}) : $column->{size}) . ')' : ($column->{extra}->{list} ? ' (' . join(', ',map { '\'' . $_ . '\'' } @{$column->{extra}->{list}}) . ')' : '')) . ' </font>' .
                '<font face="monospace" color="' . $column_color . '">' . $column->{name} . '</font>' .
                ($column->{pk} ? '<font color="' . $extra_color . '"> PK</font>' : '') . 
                ($column->{is_nullable} ? '' : '<font color="' . $extra_color . '"> NOT NULL</font>') . 
                '</td></tr>';
        }
        my $rels = '';
        foreach my $rel (@{$entity->{relations}}) {
            $rels .= '<tr><td port="' . $rel->{name} . '" align="left" bgcolor="' . $node_color . '">' .
                '<font color="' . $datatype_color . '">' . $all_entities->{$rel->{foreign_entity}}->{title} . ' [' . $rel->{multi} .  '] </font>' .
                '<font face="monospace" color="' . $relation_color . '">' . $rel->{name} . '</font>' .
                '</td></tr>';
        }
        $rels = '<tr><td><font color="gray">no relations</font></td></tr>' if length($rels) == 0;
        my $border = 0;
        if (exists $entities_of_interest{$entity->{title}}) {
            $border = 4;
        }

        print { $dot_fh } $indent . $entity->{node} . ' [shape=plaintext, style="", label=<' .
            '<table BORDER="' . $border . '" CELLBORDER="1" CELLSPACING="0" CELLPADDING="4" bgcolor="' . $node_color . '">' .
              '<tr><td port="title" bgcolor="' . $db_color . '"><font point-size="14">' . $entity->{title} . '</font></td></tr>' .
              '<tr><td port="stereotype" bgcolor="' . $node_color . '"><font point-size="12">' . $entity->{stereotype} . '</font></td></tr>' .
              '<tr>' .
                '<td>' .
                  '<table border="0" cellborder="0" cellspacing="0" cellpadding="1">' .
                    $columns .
                  '</table>' .
                '</td>' .
              '</tr>' .
              '<tr>' .
                '<td>' .
                  '<table border="0" cellborder="0" cellspacing="0" cellpadding="1">' .
                    $rels .
                  '</table>' .
                '</td>' .
              '</tr>' .              
            '</table>' .
        ">];\n";
    }
    print { $dot_fh } "\n";
    foreach my $rel (@$relations) {
        my $self = $entities->{$rel->{self_entity}};
        my $foreign = $entities->{$rel->{foreign_entity}};        
        print { $dot_fh } $indent . $self->{node} . ':' . $rel->{name} . (length($self_port_position) > 0 ? ':'.$self_port_position : '') . ' -> ' . $foreign->{node} . ':' . $rel->{foreign_column} . (length($foreign_port_position) > 0 ? ':'.$foreign_port_position : '') . ' [' .
            (defined $rel->{self_columns} ? ' headlabel="' . $rel->{self_columns} . '" ': '') .
            (defined $rel->{foreign_columns} ? ' taillabel="' . $rel->{foreign_columns} . '" ': '') .
            ' dir="forward"' .
        "];\n";
    }
    
    print { $dot_fh } <<POSTAMBLE;
}
POSTAMBLE
    
    close $dot_fh or die($! . "\n");
    _log(sprintf('%s created',$dot_filename));
}

sub _create_output {
    system('dot','-T' . $ext,'-K' . $layout,$dot_filename,'-o' . $output_filename,($verbose ? '-v' : ()));
        
    if ($? == -1) {
        die('failed to execute: ' . $! . "\n");
    } elsif ($? & 127) {
        die(sprintf('dot died with signal %d, %s coredump', ($? & 127), ($? & 128) ? 'with' : 'without') . "\n");
    } else {
        if ($? == 0) {
            _log(sprintf('dot exited with value %d', $? >> 8));
        } else {
            warn(sprintf('dot exited with value %d', $? >> 8) . "\n");
        }
    }
    if (-e $output_filename) {
        _log(sprintf('%s created',$output_filename));        
    }
    return $?;
}

sub _log {
    print shift . "\n" if $verbose;
}