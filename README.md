[![Actions Status](https://github.com/tbrowder/Date-Easter/workflows/test/badge.svg)](https://github.com/tbrowder/Date-Easter/actions)

NAME
====

Date::Easter - Provides a routine to calculate the date of Easter in the Christian calendar

SYNOPSIS
========

```raku
use Date::Easter;
say Easter 2022; # OUTPUT: «2022-04-17␤»
```

DESCRIPTION
===========

Date::Easter is a module which provides a subroutine to calculate the date of Easter in the Christian calendar.

The routine's code is the Raku version of the algorithm shown at [Isn’t there a simpler way to calculate Easter?](https://www.tondering.dk/claus/cal/easter.php#simplecalc). The website is a trreasure trove of calendar information, courtesy of the very generous and talented **Claus Tøndering**, to whom I am greatly indebted.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2021 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

