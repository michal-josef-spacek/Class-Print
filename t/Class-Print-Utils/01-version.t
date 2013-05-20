# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print::Utils;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Class::Print::Utils::VERSION, 0.01, 'Version.');
