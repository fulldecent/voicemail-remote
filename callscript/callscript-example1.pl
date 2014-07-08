#!/usr/bin/perl

@months = qw( January February March April May June July August September October November December );
@days = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();

print "Today is $days[$wday] $months[$mon] $mday\n";

