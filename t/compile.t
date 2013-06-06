use Sipwise::Base;
use Module::Runtime qw(use_module);
use Test::Fatal qw(exception);
use Test::More import => [qw(done_testing ok)];

ok use_module('NGCP::Schema::Config')->instance->config_file('t/test.conf'), 'config';

for my $class_name (qw(
    accounting
    billing
    carrier
    kamailio
    ngcp
    provisioning
    sipstats
)) {
    ok(my $class = use_module("NGCP::Schema::$class_name"), "+ load $class_name");
    ok(my $schema = $class->connect, "+ connect $class_name");
    for my $source (sort $schema->sources) {
        ok(!exception { $schema->resultset($source)->first }, "select $class_name.$source");
    }
}

done_testing;
