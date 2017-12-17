# Advent of Code 2017, Day 17

At first I used an array to contain the circular buffer, which was fine for Part 1.

For Part 2, which required 50 million insertions at arbitrary positions, the array representation would have been way too slow.  Even if I'd used a linked list to speed up insertion I'd have had to insert 50 million nodes and do over 17 billion steps from one node to the next.  I'm curious how slow that would have been, but I don't feel like finding out myself at the moment.  Maybe someone on r/adventofcode will discuss a linked list approach.

My approach for Part 2 was to eyeball the output for the first 500 iterations.  I stared at the data for a while trying to think of a "math-y" solution, but none came to mind.  The patterns I noticed did help though:

- Observation: `buffer[0]` always seems to be 0.  At first I just guessed this would always be true without being able to prove it, but in hindsight I see why.  The buffer is insert-only, so the 0 will never be removed or changed to something else, and when values are inserted just before the 0, that is done by appending to the array (at least in my implementation), which leaves the 0 where it was.
- Therefore the answer for Part 2 will be the value of `buffer[1]` after 50 million insertions.
- Observation: whenever `buffer[1]` changes to n, it always seems to be on the nth iteration.  I don't know why.
- By definition `buffer[1]` only changes when the current position lands on 0, causing the new value to be inserted in the position after that.
- So really for Part 2 I don't need a representation of all the values in the circular buffer at all.  I only need to keep track of the buffer length, the current position, and the value most recently inserted at `buffer[1]`, which happens to be the iteration count at which that insertion occurred.

With this representation of the problem, it was fast enough to run 50 million iterations, each of which was a few integer arithmetic operations.

