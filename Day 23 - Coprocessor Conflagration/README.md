# Advent of Code 2017, Day 23

Part 1 was largely copy-and-paste.  The description made clear that the suggested approach was to repurpose my code for Day 18, so I did that.

The description for Part 2 strongly hinted that reusing this code wasn't going to be fast enough to terminate in a reasonable time.  At first I ignored this and hoped it was just a matter of patience.  Maybe if I ran the program long enough I'd spot a pattern and that would help figure out the answer.  But I should have known better than to ignore a strong AoC hint.  After all, this has been a recurring theme this year: using large numbers so that Part 2 can't be solved with the brute force that might work for Part 1.  After a little fiddling, I accepted the fact that I'd need to read the assembly code and understand it.

To do this, I first annotated the assembly code with pseudocode.  The result of that is in [part2-asm.txt](part2-asm.txt).  Then I copied the pseudocode into a new file ([part2-pseudocode.txt](part2-pseudocode.txt)) and reworked it a little at a time, figuring out where the loops were and how the registers were being used, until I saw what it was doing: it was counting non-primes.  It was such a relief to spot small patterns and see how they added up to larger ones.

Counting non-primes was easy enough to code in Swift, but when I submitted my answer it was wrong.  My hunch was that I had an off-by-one error and the answer was simply 1 greater than what I had submitted.  If I'd been thinking more competitively I could have tested that hunch (which turned out to be correct, so my AoC stats would have been a little better), and **then** gone looking for the actual bug.  Nothing wrong with testing a hunch.  Instead, I reviewed the assembly code line by line, over and over.  I still couldn't find fault with my analysis.  Finally I tweaked my Swift code to look slightly more like my pseudocode and to my surprise got a different answer.  That's when I realized where the off-by-one was -- I saw why my `to:` needed to be a `through:` -- and now I had the right answer.  I see on r/adventofcode that I wasn't the only one to make this mistake.

One mistake I almost made was seeing `sub c -17000` and thinking `c -= 17000`.  I caught myself doing that once and was careful not to repeat the error.

Here's how the registers were being used, at least in the input I was given:

- `a`: Flag indicating how to initialize `b` and `c`.
- `b`: Loop variable for the main loop, initialized to either 79 or 107900, depending on the value of `a`.
- `c`: Constant used to terminate the main loop, initialized to either 79 or 124900, depending on the value of `a`.
- `d`, `e`: Inner loop variables used to determine whether the value of `b` is prime by testing whether `d*e == b`.
- `f`: Flag indicating whether the value of `b` is prime.
- `g`: Temporary variable used in multiple places to test whether two values are equal, by testing whether their difference is 0.
- `h`: Running count of non-prime values of `b`.

