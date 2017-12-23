# Advent of Code 2017, Day 22

I didn't bring my A game for this one.  My first test of Part 1 with the example input did not get the right answer.  Okay, that happens, but then to help find my bug, I got preoccupied producing debugging output that looked just right.  Unfortunately, my code to do **that** kept having bugs.  Perhaps I could have done just as well or better by eyeballing the code a little harder, and hopefully spotting my error, **before** diving into writing debug code.

I made an error when listing the unit vectors for the possible directions the "virus" can be facing.  Something like a 1 should have been a -1, or vice versa.  This is at least the second time I've made that mistake.

Indecision over what coordinate system to use was a needless time sink.

It wasn't all mistakes: I did remember that strictly speaking `%` is a remainder operator in Swift, not a modulo operator, which means `-1 % 4` is actually -1, not 3.

