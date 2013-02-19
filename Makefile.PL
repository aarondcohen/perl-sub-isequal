use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME                => 'Sub::IsEqual',
	AUTHOR              => q{Aaron Cohen <acohen@shutterstock.com>},
	VERSION_FROM        => 'lib/Sub/IsEqual.pm',
	ABSTRACT            => 'Determine if two things are equal',
	($ExtUtils::MakeMaker::VERSION >= 6.3002
		? ('LICENSE'=> 'perl')
		: ()),
	PL_FILES            => {},
	PREREQ_PM => {
		'FindBin'         => 0,
		'List::Util'      => 0,
		'Scalar::Util'    => 0,
		'Set::Functional' => 0,
		'Test::Most'      => 0,
	},
	dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean               => { FILES => 'Sub-IsEqual-*' },
	META_MERGE => {
		resources => {
			repository => 'git://github.shuttercorp.net/acohen/perl-sub-isequal.git',
			homepage   => 'http://github.shuttercorp.net/acohen/perl-sub-isequal',
			bugtracker => 'http://github.shuttercorp.net/acohen/perl-sub-isequal/issues',
		},
	},
);
