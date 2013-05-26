package Class::Print::Utils;

# Pragmas.
use base qw(Exporter);
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Error::Pure qw(err);
use Indent;
use Readonly;
use Scalar::Util qw(blessed);

# Constants.
Readonly::Array our @EXPORT_OK => qw(print_one print_value);
Readonly::Scalar our $EMPTY_STR => q{};

# Version.
our $VERSION = 0.01;

# Print helper.
sub print_one {
	my ($self, $key, $text, $indent, $value_callback) = @_;
	if (! defined $indent) {
		$indent = Indent->new;
	} else {
		if (! blessed($indent) || ! $indent->isa('Indent')) {
			err 'Bad Indent object.';
		}
	}
	if (defined $self->{$key}) {

		# Value.
		my $value;
		if (defined $value_callback) {
			$value = $value_callback->($self, $self->{$key});
		} else {
			$value = $self->{$key};
		}

		# Print value.
		return $indent->get.$text.': '.print_value($value);

	} else {
		return ();
	}
}

# Print value helper.
sub print_value {
	my $value = shift;
	my $ref = ref $value;
	my $ret;

	# Scalar.
	if ($ref eq $EMPTY_STR) {
		$ret = $value;

	# Array.
	} elsif ($ref eq 'ARRAY') {
		foreach my $arr_value (@{$value}) {
			if ($ret) {
				$ret .= ', ';
			}
			$ret .= print_value($arr_value);
		}

	# Object.
	} elsif (blessed($value)) {
		$ret = eval {
			$value->id;
		};
		if ($EVAL_ERROR) {
			err "Value object doesn't support id() method.",
				'Object', $ref;
		}
	} else {
		err 'Not supported type of value.';
	}
	return $ret;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Class::Print::Utils - Class::Print utilities.

=head1 SYNOPSIS

 use Class::Print::Utils qw(print_one print_value);
 my $ret = print_one($self, $key, $text, $indent, $value_callback);
 my $ret = print_value($value);

=head1 SUBROUTINES

=over 8

=item B<print_one($self, $key, $text[, $indent, $value_callback])>

 Returns '$key' parameter from $self with $text for print.
 If $indent present, print before output string.
 If $value_callback present, use callback value as value.
 Arguments for callback are:
 - $self
 - $value
 Returns string with information.

=item B<print_value($value)>

 Get printable serialization of value.
 Supported values are:
 - scalar - Print scalar.
 - array - Print array as join ', ', @array.
 - object - Print object->id.
 Returns string with value serialization.

=back

=head1 ERRORS

 print_one():
        Bad Indent object.
        Not supported type of value.
        Value object doesn't support id() method.
                Object: %s

 print_value():
        Not supported type of value.
        Value object doesn't support id() method.
                Object: %s

=head1 EXAMPLE1

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

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Indent;
 use Class::Print::Utils qw(print_value);

 # TODO

 # Output.

=head1 DEPENDENCIES

L<English>,
L<Error::Pure>,
L<Exporter>,
L<Indent>,
L<Readonly>,
L<Scalar::Util>.

=head1 SEE ALSO

L<Class::Print>.

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
