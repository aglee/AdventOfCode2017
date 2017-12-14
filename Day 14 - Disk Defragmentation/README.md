# Advent of Code 2017, Day 14

Day 14 took me almost 3 hours total, even though a lot of it was basically copying and tweaking code from previous days.  I haven't reviewed my code, but it felt like in some of the basic setup stuff (like construction the graph for Part 2) I was working harder than I needed to.

For Part 1, I copy-pasted my knot hash code from Day 10 into the file `knothash.swift`.  I was surprised how unfamiliar that code looked after only 4 days.  Fortunately it only needed a little tweaking.

For Part 2, I copy-pasted my graph code from Day 12 into the file `regions.swift`.  I figured I'd reuse the breadth-first search I'd written to count the connected components in a graph.  In theory that should have meant Part 2 would go smoothly and easily, but it took me longer than expected to get it working.

- I got sidetracked writing a `Point` struct (well, actually copying Apple's `GridPoint` example code), then decided that was needless plumbing and threw it away.  Instead I simply used the string `\(row),\(col)` to represent points in a way that could be used as dictionary keys and set elements.
- I had a bug during graph construction where I was neglecting to check that a neighboring square was "used" before adding the graph edge.
- I had a bug where I was failing to count single isolated squares as regions.


