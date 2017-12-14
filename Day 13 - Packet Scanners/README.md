# Advent of Code 2017, Day 13

The time it took me to solve today's puzzle was by far the longest so far this year, and yet my solution is one of the smallest in terms of lines of code.

For Part 1 I used more elaborate logic than was necessary, including a `Layer` class.  In theory it would have been fine to merely tweak that logic to solve Part 2, but I saw it was taking a long time to test lots of values of `delay`.  It's possible I could have let that run, slow as it was, and still gotten the answer sooner than I did, but I wouldn't have been as satisfied.  I looked harder and realized I could remove things.  For example, I didn't need to create an object to simulate layers and scanners -- I just needed to do some modulo math.  I didn't need to simulate the packet going through the layers in order, or to account for it going through depths that had no layer.

Once I had simplified the logic it ran fast enough to give me the Part 2 answer in about a minute and 15 seconds.  I still wonder whether using more math could have made it simpler and faster -- maybe something using a least common multiple of all the `2*(range-1)` values.  I notice too how I was so eager to code and run my simulation that I was slow to apply mathematical intuition, and I ignored the mathematical hunches I did have.

A clue I missed due to not thoroughly grokking the puzzle description: when I was testing my Part 2 code on the example input, I got 4 as the lowest number and 10 as the next lowest.  I belatedly noticed this part (emphasis added):

> Because **all smaller delays would get you caught**, the fewest number of picoseconds you would need to delay to get through safely is 10.

Only when I noticed this did I realize that the 4 I had gotten was a clue to a flaw in my logic -- namely, it's possible to get "caught" **ONLY** in layer 0, and so a zero trip severity was not sufficient to say the packet hadn't been caught.  This had even crossed my mind earlier, but not strongly enough.


## Code changes since I submitted my AoC answers

- For Part 2 it isn't necessary to compute the whole `tripSeverity`.  We only need to see if the packet gets caught in any layer, and exit the function immediately if so.  After seeing comments from an RCer about how this insight sped up her solution from 19 seconds to 2 seconds, I created a separate `isCaught` function.  This sped my solution from 1'20" to 30" -- still much slower than hers, but faster than before.
- I realized I didn't need to store the layer info in a dictionary.  Changed `layerRanges` to an array of `(depth, range)` tuples.  Not only was this simpler, it further sped up the Part 2 execution time from 30 seconds to 3 seconds, which is in the ballpark of Laura's solution.

