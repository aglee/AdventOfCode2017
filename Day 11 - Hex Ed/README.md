# Advent of Code 2017, Day 11

I got nervous about how to represent a hexagonal grid, but after drawing some pictures I figured it out.

Consider any hexagon A and its six neighbors B through G, going clockwise with B to the north of A.  The centers of these seven hexagons form a lattice which is itself a hexagon.  That lattice can be mapped to Cartesian lattice points like this:

```plain
    B---C
   /|  /|
  / | / |
 /  |/  |
G---A---D
|  /|  /
| / | /
|/  |/
F---E
```

We've shifted the two east neighbors (C and D) up and the two west neighbors (F and G) down so they land on integer coordinates.  So now:

- Going north from A to B means offsetting (x, y) by (0, 1).
- Going northeast from A to C means offsetting by (1, 1).
- Southeast to F is (1, 0).  (This is east in Cartesian coordinates but southeast in hex coordinates.)
- South to E is (0, -1).
- Southwest to F is (-1, -1)
- Northwest to G is (-1, 1).

Hence the `xyOffsets` dictionary.

The reasoning for `minStepsToChild` is like this.  There are two cases.

- Case 1: The child is either northwest or southeast of the origin.  In this case the only steps from the origin that take us closer to the child are either horizontal or vertical, so the minimum distance is the Manhattan distance.  In code, this translates to `abs(childX) + abs(childY)`.

- Case 2: The child is either northeast or southwest of the origin.  In this case it is possible for diagonal steps to take us closer to the child, as well as horizontal or vertical.  So now imagine the origin and child are on corners of a rectangle.  The rectangle has a `short` edge and a `long` edge.  You make the longest diagonal move you can (num steps = `short`), which puts you somewhere on the `long` edge. You then travel the rest of the way on the long edge (num steps = `long - short`). The total number of steps is thus `short + (long - short) = long`.  In code, this translates to `max(abs(childX), abs(childY))`.

It doesn't matter which of these cases we use when the child is on the origin; the logic gives the right answer (0) either way.

I got the `minStepsToChild` logic wrong the first time.  I thought the answer would be Manhattan distance (Case 1).  After a little head-scratching, I figured out Case 2 and got the right answer -- but I didn't realize Case 1 was still needed for completeness until I saw a fellow RCer's solution.

Speaking of other RCers (that's Recurse Center folks) -- I thought I'd reasoned this out pretty well, but I saw solutions much more concise and interesting than mine.  I find there's something about having coded my own solution that enhances my appreciation of theirs.

See also: <https://www.redblobgames.com/grids/hexagons/>.

