
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "utf8" => 0
  },
  "c_source" => "c",
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Unicode case-folding for case-insensitive lookups.",
  "dist_author" => [
    "Andrew Rodland <arodland\@cpan.org>"
  ],
  "dist_name" => "Unicode-CaseFold",
  "dist_version" => "0.02",
  "license" => "perl",
  "module_name" => "Unicode::CaseFold",
  "need_compiler" => 0,
  "recommends" => {
    "XSLoader" => 0
  },
  "recursive_test_files" => 1,
  "requires" => {
    "Exporter" => 0,
    "Scalar::Util" => "1.11",
    "Unicode::UCD" => 0,
    "perl" => "5.008001",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

my $build_xs;
$build_xs = 0 if grep { $_ eq '--pp' } @ARGV;
$build_xs = 1 if grep { $_ eq '--xs' } @ARGV;
if (!defined $build_xs) {
  $build_xs = $build->have_c_compiler;
}

unless ($build_xs) {
  $build->build_elements(
    [ grep { $_ ne 'xs' } @{ $build->build_elements } ]
  );
}
$build->create_build_script;
