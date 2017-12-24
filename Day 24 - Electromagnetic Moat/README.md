# Advent of Code 2017, Day 24

Today's solution was my messiest so far.

My approach was to represent the input data as a graph of unique integer values.  An edge corresponds to a "port" as defined by the puzzle description, with the port's pin counts given by the two connected vertices.  A "bridge" thus corresponds to a path in the graph starting at the node with value 0.

It would probably have been simplest to represent the graph as something like `[Int: Set<Int>]`, mapping each number to its connected numbers, but I didn't stop and think enough about this, and I thought it would save time to copy-paste a Node class I had used in an earlier AoC puzzle (in retrospect I had over-engineered that puzzle as well).  This worked okay, it just created more work than I needed to do.  And if I was going to copy-paste useful code from past puzzles, I should probably have copied my hashable Point struct.

For Part 1 I used depth-first traversal to find the "strength" of every possible path.  One thing I stumbled on was calculating the strength properly.  I also ran into the problem of how to represent the edges I had already traversed.  Unlike with other graph problems, it didn't work to only keep track of the nodes I had visited, because it was possible to have an edge from a node to itself; for example one of the "ports" in my input data was 15/15.  I solved this by representing edges as strings of the form `a/b`, where `a` and `b` are numbers, similar to the representation used in the input data but always with `a <= b`.

For Part 2 I added a function to find the greatest path length and hacked my Part 1 code to put the Part 2 answer in a global variable.  I got stuck on a bug that was due to doing the recursion wrong.

