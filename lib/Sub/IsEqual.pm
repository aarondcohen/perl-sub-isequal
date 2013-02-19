package Sub::IsEqual;
use base 'Exporter';

=head1 NAME

Sub::IsEqual - determine if two things are equal

=cut

use strict;
use warnings;

use List::Util qw{first};
use Scalar::Util qw{refaddr};
use Set::Functional qw{symmetric_difference};

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.02';

our @EXPORT_OK = qw{is_equal};

=head1 SYNOPSIS

This module provides a function called is_equal to determine if any two
arbitrary arguments are the same.  Equality is currently defined by
string equality, so 1 and 1.0 will be considered inequal.  For data
structures, circular references will be detected.

=cut

sub is_equal {
	my ($left, $right, $recursion_check) = @_;

	#Check that both values are in the same state of definedness
	return 0 if defined($left) ^ defined($right);
	#Check that both values are defined
	return 1 if ! defined($left);
	#Check that both values are string equivalent
	return 1 if $left eq $right;

	my ($left_ref, $right_ref) = (ref($left), ref($right));

	#Check that both values refer to the same type of thing
	return 0 if $left_ref ne $right_ref;
	#Check that both values are references
	return 0 if $left_ref eq '';

	$recursion_check ||= {};
	my ($left_refaddr, $right_refaddr) = (refaddr($left), refaddr($right));

	#Check that both references are in the same visit state
	return 0 if exists $recursion_check->{$left_refaddr} ^ exists $recursion_check->{$right_refaddr};
	#Check that both references have already been visited
	return 1 if exists $recursion_check->{$left_refaddr};

	undef $recursion_check->{$left_refaddr};
	undef $recursion_check->{$right_refaddr};

	#Check that scalar references point to the same values
	if ($left_ref eq 'SCALAR' || $left_ref eq 'REF') {
		return is_equal($$left, $$right, $recursion_check);

	#Check that arrays have the same values in the same order
	} elsif ($left_ref eq 'ARRAY') {
		return
			@$left == @$right
			&& ! defined(first { ! is_equal($left->[$_], $right->[$_], $recursion_check) } (0 .. $#$left));

	#Check that hashes contain the same keys pointing to the same values
	} elsif ($left_ref eq 'HASH') {
		return
			! symmetric_difference([keys %$left], [keys %$right])
			&& ! defined(first { ! is_equal($left->{$_}, $right->{$_}, $recursion_check) } keys %$left);

	#Give up
	} else {
		die "Must define string equality for type [$left_ref]";
	}
}


1;
