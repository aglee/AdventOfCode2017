# Advent of Code 2017, Day 16

Straightforward stuff again today, at least conceptually.  Dealing with Swift strings was a bit of a pain.

I deliberately resisted my usual compulsion to wrap everything in a class, and that seemed to save me a little time in this case.

For Part 2, although I'm usually willing to wait for a brute force solution to run, I knew that a billion iterations was too much.  I knew there had to be a faster way, and sure enough I guessed right that the original sequence of "dancers" would repeat after a reasonable number of iterations.

One thing I could have done was save all the intermediate iterations in an array, so once I figured out the periodicity I could pluck the final answer from that array.  I didn't think of that, and re-ran the iterations of moves from scratch.  Fortunately, the number was small enough that this didn't take too long.  Also, I did the math correctly the first time and didn't make any off-by-one errors.

There was a puzzle on one of the earlier days, I forget which one, where I could have similarly simplified things by storing an array of results.  It would have been nice to have noticed the similarity and applied the lesson learned from the earlier exercise.

