# Notes on Advent of Code 2017, Day 3

Changed my workflow -- now using Xcode since I couldn't get Swift breakpoints to work in CodeRunner.  Also, Xcode has handy integration with Swift documentation.  I have a scratch CLI Xcode project with just two files, `main.swift` and `input.swift`.  Once I've used that to solve the puzzles, I copy those files into my AoC directory structure (which includes files like this one) and confirm that the code works in CodeRunner.  I want the code to work independent of Xcode.

One drawback is Swift's compilation time.  At some point I might give playgrounds another shot and see if I can get faster code-test-debug iterations.  Aside from that lag, I've been comfortable with Swift so far.

The problem statement mentions a term I like: "[Manhattan Distance](https://en.wikipedia.org/wiki/Taxicab_geometry)".

Solved Part 1 by hand, noticing the pattern of concentric squares centered at the origin.  Each such square of side n has n^2 in the bottom right corner.  Note also that n is always odd.  The largest perfect square less than my target number was 537^2.  So to solve Part 1 I assumed I'd already filled in a 537x537 square and figured out how much more I'd have to travel from there to reach the target number.

I lost a bunch of time on Part 2 due to coding errors in two places:

- The list of (dx, dy) pairs to use to locate a cell's neighbors.  I created the list by hand and it had errors.  Would have been quicker and safer to use nested loops letting both dx and dy range from -1 to 1, and skipping the case of (0, 0).
- The (dx, dy) logic for populating each "leg" of a "loop".

In retrospect I wonder if I'd have been better off coding Part 1 instead of doing the math on paper.  I could then have modified the working code to solve Part 2.  Total time to solve both might have been faster.

