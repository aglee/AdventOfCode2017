# Advent of Code 2017, Day 16

Straightforward stuff again today, at least conceptually.  Dealing with Swift strings was a bit of a pain.

I deliberately resisted my usual compulsion to wrap everything in a class, and that seemed to save me a little time in this case.

For Part 2, although I'm usually willing to wait for a brute force solution to run, I knew that a billion iterations was too much.  I knew there had to be a faster way, and sure enough I guessed right that the original sequence of "dancers" would repeat after a reasonable number of iterations.

One thing I could have done was save all the intermediate iterations in an array, so once I figured out the periodicity I could pluck the final answer from that array.  I didn't think of that, and re-ran the iterations of moves from scratch.  Fortunately, the number was small enough that this didn't take too long.  Also, I did the math correctly the first time and didn't make any off-by-one errors.

There was a puzzle on one of the earlier days, I forget which one, where I could have similarly simplified things by storing an array of results.  It would have been nice to have noticed the similarity and applied the lesson learned from the earlier exercise.

- **Update:** It was [Day 6](https://www.reddit.com/r/adventofcode/comments/7k572l/2017_day_16_solutions/drbw6a4/).  And from that comment I see that for Day 6 I could have used [Floyd's algorithm](https://en.wikipedia.org/wiki/Cycle_detection#Floyd.27s_Tortoise_and_Hare), aka "tortoise and hare", for cycle detection.  I knew of that algorithm (which I didn't know had a name) as a classic go-to in linked list puzzles, but it dawns on me now that the linked list is just an implementation detail.  The algorithm applies to any forward-marching sequence that may have a cycle.  A neat benefit of Floyd's algorithm is that it requires O(1) space.  But for Day 16 I don't think it helps, because we can be pretty sure there's a cycle.  (Indeed there must be eventually, as there's only a finite number of dancer permutations.  The thing we're assuming is that the cycle happens soon enough that it's practical for us to find it by brute force.)  Furthermore, we know the whole sequence repeats itself, so we don't have to look for where the cycle begins -- **every** node on the path begins a cycle.  And finally, there is a time-space tradeoff; for Day 16 IMO it's worth memoizing the intermediate results because then the answer to Part 2 is just an array lookup.  I could be wrong, though.

