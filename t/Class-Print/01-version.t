# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Class::Print::VERSION, 0.01, 'Version.');
