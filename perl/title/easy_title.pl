#!/usr/bin/perl -w 


# @filename           :  array.pl
# @author             :  Copyright (C) drunkwater
# @date               :  Mon Jan 15 12:43:38 HKT 2018
# @function           :  create file within C style's hex array.
# @see                :  
# @require            :  



# require here
#require v5.6.1;


# use standard library/use warnings
use strict;
use warnings;

#use File::Copy;


# use other library/perl modules, writed by drunkwater

my $OS_DATE;

sub getCurrentTime
{
	my $time = time();
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($time);

	$sec  = ($sec<10)?"0$sec":$sec;
	$min  = ($min<10)?"0$min":$min;
	$hour = ($hour<10)?"0$hour":$hour;
	$mday = ($mday<10)?"0$mday":$mday;
	$mon  = ($mon<9)?"0".($mon+1):$mon;
	$year+=1900;
	my $weekday = ('Sun','Mon','Tue','Wed','Thu','Fri','Sat')[$wday];
	return { 'second' => $sec,
			'minute' => $min,
			'hour'   => $hour,
			'day'    => $mday,
			'month'  => $mon,
			'year'   => $year,
			'weekNo' => $wday,
			'wday'   => $weekday,
			'yday'   => $yday,
			'date'   => "$year$mon$mday"
			};
}

sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

sub open_filehandle_for_output
{
    my $filename = $_[0];
    my $overWriteFilename = ">" . $filename;
    local *FH;

    open (FH, $overWriteFilename) || die "Could not open $filename";

    return *FH;
}

sub open_filehandle_for_input
{
    my $filename = $_[0];
    local *FH;

    open (FH, $filename) || die "Could not open $filename";

    return *FH;
}


sub main
{
	my $fn0="./easy_algorithms.c2";
	my $fn0Ref=open_filehandle_for_input($fn0);

	my $fn1="./easy.list";
	my $fn1Ref=open_filehandle_for_output($fn1);

	my $tag = 0;
	my $sequence = 0;
	my $easyIndex = 0;
	while (<$fn0Ref>)
	{
		if(($tag eq 0) && $_=~ /^(\d+)/)
		{
			$sequence = $1;
			$tag = 1;
		}

		if(($tag eq 1) && $_=~ /(.*)\d\d\.\d\%/)
		{
			my $title = trim($1);
			$title =~ s/\s/_/g;
			$easyIndex = sprintf("%04d", $easyIndex);
			print $fn1Ref "c" . $easyIndex . "_" . $sequence . "_" . $title . "\n";
			$easyIndex++;
			$tag = 0;
		}
	}
	close($fn1Ref);
	close($fn0Ref);



	return 0;
}
################################################################################
my $date = &getCurrentTime();
$OS_DATE = $date->{date};
chomp($OS_DATE);

main();

exit 0;
################################################################################

