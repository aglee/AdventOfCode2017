# Advent of Code 2017, Day 15

Today's puzzle was pretty straightforward.

As usual, afterwards I second-guessed myself about how much plumbing was in my code and whether it could have been simpler and shorter.  My current self-generous view is that maybe the verbosity is okay, in that it could be interpreted as me thinking out loud about the problem.  In real life I'd always be able to go back and boil the code down.  For example, for this puzzle I could have *all* number generation be "picky", with the "pickiness" set to 1 by default.  This would have shortened the `Gen` class and the `solve1` and `solve2` functions.

I wondered about ways to speed up execution.  For example, I fiddled afterwards and found that I could have saved a couple of seconds on Part 2 (5 seconds vs. 7 seconds) by using bit arithmetic instead of `%` to calculate mod 4 and mod 8.  I tried to think of a way to speed up calculating mod 2147483647, which is `1<<31 - 1`, or `0b0111_1111_1111_1111_1111_1111_1111_1111` (thirty-one 1-bits).  I want to say something like adding the first 32 bits of the number to the second 32 bits?  Maybe iterating until the first 32 bits is 0?  Very possibly that is totally wrong.  Anyway I don't know if the savings in execution time would have made up for the time spent coding that.  Maybe it would have, given that I had to run the code several times before I got the right answers with the example inputs.  If I were a fast enough solver to be anywhere near the worldwide top-100 leaderboard, a few seconds could have made the difference between being on it and not.

An RCer pointed out that this was straightforward in Python, using actual generators in the Python sense.  I didn't pick up on this tipoff from the word "generator".  I'm making a note to read up on how they're done in Swift -- and in Python, for that matter.


<a name="modthoughts"></a>
## Further thoughts on modulo arithmetic

I was almost right regarding mod 2147483647.  My guess was to add the last 32 bits to everything before them.  The actual bit-tweaking way to do it was to add the last **31** bits (not 32) to everything before them.  This:

```swift
// Call this "Version A".
value = (value * factor) % 2147483647
```

...is equivalent to this:

```swift
// Call this "Version B".
var x = value * factor
while true {
	let leftBits = x >> 31
	if leftBits == 0 { break }
	let rightBits = x & 0b0111_1111_1111_1111_1111_1111_1111_1111
	x = leftBits + rightBits
}
value = x
```

I figured this out by considering the equivalent problem in base 10, which was how I made my guess in the first place.  Consider that `157000 = 157 (mod 999)` and note that you get the 157 by shifting the number right 3 times, 3 being the number of 9's in 999.  Consider a simpler 4-digit example, `7000 = 7 (mod 999)`.  It makes sense that the number in the 1000's place would be the answer, because `7000 = 7 * 1000 = 7 * (999 + 1)`.  We throw away 999's 7 times, with a remainder of 1 each time.  Finally, consider that `7321 = 328 (mod 999)` because `7321 = 7000 + 321 = 7 + 321 (mod 999)`.  With a little more work the general solution emerges for numbers of any length.  Change the radix from 10 to 2 and you have the binary version of this reasoning.

The reason for the temporary variable `x` in Version B is that it speeds up the execution time.  Version B takes 15-16 seconds to solve Part 1 of today's puzzle.  Consider a Version C that accesses the `Gen` object's `value` property directly:

```swift
// Call this "Version C".
value = value * factor
while true {
	let leftBits = value >> 31
	if leftBits == 0 { break }
	let rightBits = value & 0b0111_1111_1111_1111_1111_1111_1111_1111
	value = leftBits + rightBits
}
```

Apparently Swift's overhead for accessing `value` is enough to raise the execution time to 21-22 seconds.

In any case, it turns out that the bit-twiddling versions are both much slower than Version A, which does the straightforward `% 2147483647`.  Version A takes only 10 seconds to solve Part 1.  Perhaps I could have foreseen this if I'd thought about how modulo arithmetic is implemented at the instruction level.  The same instruction for integer division also produces the modulus.  So the efficiency of using that one instruction outweighed the speedup I tried to get by knowing that 2147483647 is a special number (as I did knowing 4 and 8 are special numbers), at the cost of using several instructions to do the job of one.

