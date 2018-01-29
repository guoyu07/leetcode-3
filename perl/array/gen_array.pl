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


sub array_0_65535
{
	my $cArrayFileRef = $_[0];
	my $maxSizePerLine = 65_536;
	my $maxLine = 1;
	my $size = $maxSizePerLine * $maxLine;


	print $cArrayFileRef "\nstatic int array_0_65535[". $size ."] = {";
	#scalar
	for (my $line=0; $line<$maxLine; $line++)
	{
		for (my $offset=0; $offset<$maxSizePerLine; $offset++)
		{
			my $hex = sprintf("0x%x", $offset);
			print $cArrayFileRef $hex . ",";
		}

		print $cArrayFileRef "\n";
	}
	print $cArrayFileRef "};\n";


	return 0;
}


sub array_65535_0
{
	my $cArrayFileRef = $_[0];
	my $maxSizePerLine = 65_536;
	my $maxLine = 1;
	my $size = $maxSizePerLine * $maxLine;


	print $cArrayFileRef "\nstatic int array_65535_0[". $size ."] = {";
	#scalar
	for (my $line=0; $line<$maxLine; $line++)
	{
		for (my $offset=$maxSizePerLine-1; $offset>=0; $offset--)
		{
			my $hex = sprintf("0x%x", $offset);
			print $cArrayFileRef $hex . ",";
		}

		print $cArrayFileRef "\n";
	}
	print $cArrayFileRef "};\n";


	return 0;
}


sub array_65535_odd
{
	my $cArrayFileRef = $_[0];
	my $maxSizePerLine = 65_536;
	my $maxLine = 1;
	my $size = $maxSizePerLine * $maxLine;


	print $cArrayFileRef "\nstatic int array_65535_odd[". $size ."] = {";
	#scalar
	for (my $line=0; $line<$maxLine; $line++)
	{
		for (my $offset=0; $offset<$maxSizePerLine; $offset++)
		{
			my $hex = sprintf("0x%x", $offset * 2 + 1);
			print $cArrayFileRef $hex . ",";
		}

		print $cArrayFileRef "\n";
	}
	print $cArrayFileRef "};\n";


	return 0;
}


sub array_65535_even
{
	my $cArrayFileRef = $_[0];
	my $maxSizePerLine = 65_536;
	my $maxLine = 1;
	my $size = $maxSizePerLine * $maxLine;

	print $cArrayFileRef "\nstatic int array_65535_even[". $size ."] = {";

	#scalar
	for (my $line=0; $line<$maxLine; $line++)
	{
		for (my $offset=0; $offset<$maxSizePerLine; $offset++)
		{
			my $hex = sprintf("0x%x", ($offset + 1)*2);
			print $cArrayFileRef $hex . ",";
		}

		print $cArrayFileRef "\n";
	}
	print $cArrayFileRef "};\n";


	return 0;
}


sub array_65535_random
{
	my $cArrayFileRef = $_[0];
	my $maxSizePerLine = 65_536;
	my $maxLine = 4;
	my $size = $maxSizePerLine * $maxLine;

	print $cArrayFileRef "\nstatic int array_65535_random[". $size ."] = {";

	srand;
	#scalar
	for (my $line=0; $line<$maxLine; $line++)
	{
		for (my $offset=0; $offset<$maxSizePerLine; $offset++)
		{
			my $hex = sprintf("0x%x", int(rand($maxSizePerLine+1)));
			print $cArrayFileRef $hex . ",";
		}

		print $cArrayFileRef "\n";
	}
	print $cArrayFileRef "};\n";


	return 0;
}


sub main
{
	my $cArrayFileName="./c_array.c";
	my $cArrayFileRef=open_filehandle_for_output($cArrayFileName);


	array_0_65535($cArrayFileRef);
	array_65535_0($cArrayFileRef);
	array_65535_odd($cArrayFileRef);
	array_65535_even($cArrayFileRef);
	array_65535_random($cArrayFileRef);

	close($cArrayFileRef);

	return 0;
}
################################################################################
my $date = &getCurrentTime();
$OS_DATE = $date->{date};
chomp($OS_DATE);

main();

exit 0;
################################################################################

