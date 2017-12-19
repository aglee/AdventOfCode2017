# Advent of Code 2017, Day 19

Biggest annoyance was Xcode.  My editing preferences were set to delete trailing spaces, which messed up the input data.  I had to turn off that preference and go back and re-copy the input data into my file.

Noticed the input grid was conveniently padded with spaces all around.  Used that fact instead of bothering with bounds checking.  The example input was padded with spaces except for the last line, which I padded manually.

Commented my code as I went.  Used that kind of like thinking out loud, except not out loud.

Defensive coding: I did not assume the letters would be uppercase or even necessary alphabetical, though they turned out in fact to all be A-Z.

An observation that simplified my logic: all cases are "continue in the current direction" except " " (end of the road) and "+" (change direction and THEN continue in the current direction).  No need for special handling of the case where paths overlap.

