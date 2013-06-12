package Class::Print;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print::Utils qw(print_one);
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use Indent;
use Scalar::Util qw(blessed);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Output separator.
	$self->{'output_separator'} = "\n";

	# Process parameters.
	set_params($self, @params);

	# Object.
	return $self;
}

# Print method.
sub print {
	my ($self, $object, $print_ar, $indent) = @_;
	if (! defined $indent) {
		$indent = Indent->new;
	} else {
		if (! blessed($indent) || ! $indent->isa('Indent')) {
			err 'Bad Indent object.';
		}
	}
	my @ret;
	if (! defined $print_ar) {
		$print_ar = [];
	}
	foreach my $print_one_ar (@{$print_ar}) {
		push @ret, print_one($object, @{$print_one_ar}, $indent);
	}
	return wantarray ? @ret : join $self->{'output_separator'}, @ret;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Class::Print - Perl class for helping of object information print.

=head1 SYNOPSIS

 use Class::Print;
 my $obj = Class::Print->new(%parameters);
 my @ret = $obj->print($object, $print_ar, $indent);

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * C<output_separator>

 Output separator.
 Default value is newline (\n).

=back

=item B<print($object, $print_ar, $indent)>

 Print object '$object' information defined in $print_ar.
 $print_ar is reference to array of arrays with object keys and descriptions for print.
 $indent is variable Indent object for indentation.
 When $indent not possible, create use Indent->new.
 Returns string with informations in scalar context.
 Returns array with information lines in array context.

=back

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

 print():
         Bad Indent object.

=head1 EXAMPLE

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

=head1 DEPENDENCIES

L<Class::Print::Utils>,
L<Class::Utils>,
L<Error::Pure>,
L<Indent>,
L<Scalar::Util>.

=head1 SEE ALSO

L<Class::Print::Utils>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 REPOSITORY

L<https://github.com/tupinek/Class-Print>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
