#!/usr/bin/perl -I/home/phil/perl/cpan/MathCartesianProduct/lib/
#-------------------------------------------------------------------------------
# Test Math::Cartesian::Product
# Philip R Brenan at gmail dot com, Appa Apps Ltd Inc., 2020
#-------------------------------------------------------------------------------
use warnings FATAL => qw(all);
use strict;
use Carp;
use Data::Dump qw(dump);
use Math::Cartesian::Product;
use Test::More tests=>3;

is_deeply [cartesian {\@_} [qw(a b c)], [1..2]],
 [[qw(a 1)],
  [qw(a 2)],
  [qw(b 1)],
  [qw(b 2)],
  [qw(c 1)],
  [qw(c 2)]];

my @a;
cartesian {push @a, join ' ', @_} ([0..1]) x 4;
is_deeply join("\n", @a, ''), <<END;
0 0 0 0
0 0 0 1
0 0 1 0
0 0 1 1
0 1 0 0
0 1 0 1
0 1 1 0
0 1 1 1
1 0 0 0
1 0 0 1
1 0 1 0
1 0 1 1
1 1 0 0
1 1 0 1
1 1 1 0
1 1 1 1
END

my @b; cartesian {push(@b, "@_" =~ s(\s*\Z) ()gsr) if "@{[reverse @_]}" eq "@_"} ([' ', '*']) x 8;
is_deeply [@b], [split /\n/, <<END];

      * *
    *     *
    * * * *
  *         *
  *   * *   *
  * *     * *
  * * * * * *
*             *
*     * *     *
*   *     *   *
*   * * * *   *
* *         * *
* *   * *   * *
* * *     * * *
* * * * * * * *
END
