# Advent of Code 2017, Day 15

Today's puzzle was pretty straightforward.

As usual, afterwards I second-guessed myself about how much plumbing was in my code and whether it could have been simpler and shorter.  My current self-generous view is that maybe the verbosity is okay, in that it could be interpreted as me thinking out loud about the problem.  In real life I'd always be able to go back and boil the code down.  For example, for this puzzle I could have *all* number generation be "picky", with the "pickiness" set to 1 by default.  This would have shortened the `Gen` class and the `solve1` and `solve2` functions.

I wondered about ways to speed up execution.  For example, I fiddled afterwards and found that I could have saved a couple of seconds on Part 2 (5 seconds vs. 7 seconds) by using bit arithmetic instead of `%` to calculate mod 4 and mod 8.  I tried to think of a way to speed up calculating mod 2147483647, which is `1<<31 - 1`, or `0b01111111111111111111111111111111`.  I want to say something like adding the first 32 bits of the number to the second 32 bits?  Maybe iterating until the first 32 bits is 0?  Very possibly that is totally wrong.  Anyway I don't know if the savings in execution time would have made up for the time spent coding that.  Maybe it would have, given that I had to run the code several times before I got the right answers with the example inputs.  If I were a fast enough solver to be anywhere near the worldwide top-100 leaderboard, a few seconds could have made the difference between being on it and not.

An RCer pointed out that this was straightforward in Python, using actual generators in the Python sense.  I didn't pick up on this tipoff from the word "generator".  I'm making a note to read up on how they're done in Swift.

