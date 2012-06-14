use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    build_requires       => {
        'Test::More' => '0.98',
        'Test::Requires' => 0,
    },
    configure_requires   => { 'Module::Build' => '0.38' },
    requires             => {
        'parent'                        => '0',
        'Config::Crontab' => 0,
        'AE' => 0,
        'AnyEvent::DateTime::Cron' => 0,
        'Log::Minimal' => 0,
        'URI::Escape' => 0,
        'File::Path' => 2,
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'MyCron',
    module_name => 'MyCron',

    # script_files => [''],

    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
   
    create_readme  => 1,
    create_license => 1,
);
$build->create_build_script();

