#!/bin/perl
#Read LF0 file(or other binary file) and convert to text file!
#author: shuaijiang
#date: 20141223
use strict;

if($#ARGV != 1)
{
	print "Usage: perl file.pl input output\n";
	exit;
}
my $file_in	 = $ARGV[0];
my $file_out = $ARGV[1];
my $buff;

open(IN,"$file_in")    or die "Can't open $!\n";
open(OUT,">$file_out") or die "Can't open $!\n";
binmode(IN);
while(read(IN,$buff,4))
{
	my $lf0 = unpack('f',$buff);
	print OUT "lf0=$lf0\n";
}
close(IN);
close(OUT);
