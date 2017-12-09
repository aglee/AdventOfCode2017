# Advent of Code 2017, Day 9

As usual a lot of my bugs were due to an incomplete or incorrect mental model of the problem at hand.  For example, I misunderstood what was asked for in Part 1.  Also, I carelessly tested my Part 2 solution using Part 1's *group* examples instead of the *garbage* examples (which I had not even noticed in Part 1); as a result, my results when testing Part 2 didn't match the example outputs -- there weren't even the same number of them, which I noticed belatedly.

I did notice that "score" is just the depth of the tree node (with the root at depth 1), and originally I had a `depth` computed property, but I kept getting the wrong answer and I thought maybe I had been mistaken about score being depth, so I created the `score` stored property plus some logic to set it for all tree nodes, which was unnecessary.

I kind of kludged up the code to accommodate test vs. real inputs and Part 1 vs. Part 2 outputs.  Kind of silly to have `solve1(_:)` return a tuple, but whatever.

