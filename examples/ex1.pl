#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Class::Print::Utils qw(print_one);

# Object.
my $self = {
        'type' => 'LS_XXX01',
        'name' => 'Test LS_XXX01',
};

# Print out.
print print_one($self, 'type', 'Foo')."\n";
print print_one($self, 'name', 'Bar', Indent->new('indent' => 'XXX'))."\n";
print print_one($self, 'name', 'Bar', undef, sub {
        my ($self, $value) = @_;
        if ($value eq 'Test LS_XXX01') {
                return 'Foo bar';
        }
        return;
})."\n";

# Output:
# Foo: LS_XXX01
# XXXBar: Test LS_XXX01
# Bar: Foo bar