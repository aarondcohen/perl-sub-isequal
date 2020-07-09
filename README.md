# NAME

Sub::IsEqual - determine if two arguments are equal

# VERSION

Version 0.03

# SYNOPSIS

This module provides a function called is\_equal to determine if any two
arbitrary arguments are the same.  Equality is determined by definedness,
structure, and string equality, so 1 and 1.0 will be considered inequal.
For data structures, circular references will be detected.

# METHODS

## is\_equal

Given 2 arguments, determine if they are equivalent using string equality
and deep comparison.  For large data structures, is\_equal will attempt to
walk the structure, comparing all key-value paris for hashes, checking the
order in arrays, and following all references while checking for loops.
Blessed objects must be the same value in memory, by default, but may define
their own equivalence by overloading the eq operator. The only exception
to all of this is undef, which is only equivalent to itself.

Examples:

        is_equal(undef, undef); # => true
        is_equal(undef, ''); # => false
        is_equal(1, 1.0); # => false
        is_equal("mom", "mom"); # => true
        is_equal([qw{hello world}], [qw{hello world}]); # => true
        is_equal({hello => 1}, {hello => 1}); # => true

# AUTHOR

Aaron Cohen, `<aarondcohen at gmail.com>`

# ACKNOWLEDGEMENTS

This module was made possible by [Shutterstock](http://www.shutterstock.com/)
([@ShutterTech](https://twitter.com/ShutterTech)).  Additional open source
projects from Shutterstock can be found at
[code.shutterstock.com](http://code.shutterstock.com/).

# BUGS

Please report any bugs or feature requests to `bug-sub-isequal at rt.cpan.org`, or through
the web interface at [https://github.com/aarondcohen/perl-sub-isequal/issues](https://github.com/aarondcohen/perl-sub-isequal/issues).  I will
be notified, and then you'll automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Sub::IsEqual

You can also look for information at:

- Official GitHub Repo

    [https://github.com/aarondcohen/perl-sub-isequal](https://github.com/aarondcohen/perl-sub-isequal)

- GitHub's Issue Tracker (report bugs here)

    [https://github.com/aarondcohen/perl-sub-isequal/issues](https://github.com/aarondcohen/perl-sub-isequal/issues)

- CPAN Ratings

    [http://cpanratings.perl.org/d/Sub-IsEqual](http://cpanratings.perl.org/d/Sub-IsEqual)

- Official CPAN Page

    [http://search.cpan.org/dist/Sub-IsEqual/](http://search.cpan.org/dist/Sub-IsEqual/)

# LICENSE AND COPYRIGHT

Copyright 2013 Aaron Cohen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
