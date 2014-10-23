#!/bin/perl
#This Perl script is rename given files to given name

#Author: shuaijiang
#Email: zhaoshuaijiang8@gmail.com
#Date: 2014.10.23

use strict;

if($#ARGV != 1)
{
	print "Usage: perl file.pl old_file new_file\n";
	exit;
}
my $old_file = $ARGV[0];
my $new_file = $ARGV[1];

rename($old_file,$new_file) or die "rename failed:$!\n";
