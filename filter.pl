#!/bin/perl
#This Perl script is copy files from given source directory to 
#given target directory according to given scp

#Author: shuaijiang
#Email: zhaoshuaijiang8@gmail.com
use strict;
use File::Copy;

if($#ARGV != 3)
{
	print "Usage: perl file.pl scp source_path target_path suffix\n";
	exit;
}
my $scp = $ARGV[0];
my $source_path = $ARGV[1];
my $target_path = $ARGV[2];
my $suffix = $ARGV[3];

open(SCP,"<$scp") or die "Can't open $!\n";
while (<SCP>) {
	chomp;
	my $file = $_;
	my $source_file = $source_path . '/' . $file . $suffix;
	my $target_file = $target_path . '/' . $file . $suffix;
	print "source_file=$source_file target_file=$target_file\n";
	copy("$source_file","$target_file") or die "Copy file failed!\n";
}
close(SCP);