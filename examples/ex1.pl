#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print;

# Object.
my $obj = Class::Print->new;

# Example class.
my $example = bless { 'id' => '0001' }, 'Example';

# Print out.
print scalar $obj->print($example, [
        ['id', 'Identification'],
]);
print "\n";

# Output:
# Identification: 0001