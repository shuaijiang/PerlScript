#!/bin/perl
#Read MGC file(or other binary file) and convert to text file!
#author: shuaijiang
#date: 20141223
use strict;

if($#ARGV != 2)
{
	print "Usage: perl file.pl input output dim\n";
	exit;
}
my $file_in	 = $ARGV[0];
my $file_out = $ARGV[1];
my $dim      = $ARGV[2];
my $buff;

open(IN,"$file_in")    or die "Can't open $!\n";
open(OUT,">$file_out") or die "Can't open $!\n";
binmode(IN);

my $count = 1;
my @mgc_frame=();
while(read(IN,$buff,4))
{
	my $mgc_point = unpack('f',$buff);
	push(@mgc_frame,$mgc_point);
	if($count % $dim == 0)
	{
		print OUT "mgc=@mgc_frame\n";
		@mgc_frame = ();
	}
	$count ++;
}
close(IN);
close(OUT);
