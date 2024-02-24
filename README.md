[![Actions Status](https://github.com/tbrowder/Date-Easter/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Date-Easter/actions) [![Actions Status](https://github.com/tbrowder/Date-Easter/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Date-Easter/actions) [![Actions Status](https://github.com/tbrowder/Date-Easter/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Date-Easter/actions)

NAME
====

Date::Easter - Provides routines to calculate the dates of Easter and related events in the Christian calendar

SYNOPSIS
========

```raku
use Date::Easter;
say Easter 2022; # OUTPUT: «2022-04-17␤»
```

DESCRIPTION
===========

**Date::Easter** is a module which provides a subroutine to calculate the dates of Easter in the Christian calendar. The sub returns a Raku **Date** object.

The routine's code is the Raku version of the algorithm shown at [Isn’t there a simpler way to calculate Easter?](https://www.tondering.dk/claus/cal/easter.php#simplecalc). The website is a treasure trove of calendar information, courtesy of the very generous and talented **Claus Tøndering**, to whom I am greatly indebted.

Another routine returns a hash of `Date::Event`s for use with the `Calendar` module. The hash is keyed by a `Date` with each key's value an array of `Date::Event` objects whose attributes describe the Lenten and post-Lenten Christian celebratory events of:

  * Ash Wednesday 

    The beginning of Lent [46 days before Easter]

  * Palm Sunday 

    Jesus Christ's entry into Jerusalem [the Sunday before Easter]

  * Good Friday 

    Jesus Christ's crucifixion [the Friday before Easter]

  * Easter Sunday

    The resurrection of Jesus Christ

  * Ascension 

    The ascension into Heaven of Jesus Christ [40 days after Easter]

  * Pentecost 

    The descent of the Holy Sprit upon the Virgin Mary and the Disciples of Jesus Christ [50 days after Easter]

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2021-2024 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

