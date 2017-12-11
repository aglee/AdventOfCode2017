# Advent of Code 2017, Day 11

I got nervous about how to represent a hexagonal grid, but after drawing some pictures I figured out how to map it to a Cartesian grid.

Consider any hexagon A and its six neighbors B through G, going clockwise with B to the north of A.  The centers of these seven hexagons form a lattice.  That lattice can be mapped to Cartesian lattice points like this:

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

We've shifted the two east neighbors up and the two west neighbors down.  Now, going north means offsetting (x, y) by (0, 1).  Going northeast means offsetting by (1, 1), southeast is (1, 0), etc.  Hence the `xyOffsets` dictionary.

The reasoning for `minStepsToChild` is like this.  There are two cases.  (Note: I'd only thought of the second case, which happened to work with my inputs.  I understood the need for the second case after seeing a fellow RCer's solution.)

- Case 1: The child is either northwest or southeast of the origin.  In this case the only possible steps from the origin are horizontal or vertical, so the minimum distance is the Manhattan distance.

- Case 2: The child is either northeast or southwest of the origin.  In this case steps can be diagonal as well as horizontal or vertical.  Imagine the two points are on diagonally opposite corners of a rectangle.  The rectangle has a `short` edge and a `long` edge.  You make the longest diagonal move you can (num steps = `short`), which puts you somewhere on the `long` edge. You then make up the difference. The number of steps in that difference is `long - short`, so the total is `long`.

Both of these cases cover the case where the child is on the origin.

I got the `minStepsToChild` logic wrong the first time.  I thought the answer would be Manhattan distance (Case 1).  After a little head-scratching, I figured out Case 2 and got the right answer -- but I didn't realize Case 1 was still needed for completeness until I saw a fellow RCer's solution.



