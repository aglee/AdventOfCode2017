# Notes on Advent of Code 2017, Day 3

Changed my workflow -- now using Xcode since I couldn't get Swift breakpoints to work in CodeRunner.  Also, Xcode has handy integration with Swift documentation.  I have a scratch CLI Xcode project with just two files, `main.swift` and `input.swift`.  Once I've used that to solve the puzzles, I copy those files into my AoC directory structure (which includes files like this one) and confirm that the code works in CodeRunner.  I want the code to work independent of Xcode.

One drawback is Swift's compilation time.  At some point I might give playgrounds another shot and see if I can get faster code-test-debug iterations.  Aside from that lag, I've been comfortable with Swift so far.

The problem statement mentions a term I like: "[Manhattan Distance](https://en.wikipedia.org/wiki/Taxicab_geometry)".

Solved Part 1 by hand, noticing the pattern of concentric squares centered at the origin.  Each such square of side n has n^2 in the bottom right corner.  Note also that n is always odd.  The largest perfect square less than my target number was 537^2.  So to solve Part 1 I assumed I'd already filled in a 537x537 square and figured out how much more I'd have to travel from there to reach the target number.  [**Update:** I've refactored the code so it now solves both Part 1 and Part 2.  There's a base class called `Grid`, with subclasses `GridPart1` and `GridPart2`.]

I lost a bunch of time on Part 2 due to coding errors in two places:

- The list of (dx, dy) pairs to use to locate a cell's neighbors.  I created the list by hand and it had errors.  Would have been quicker and safer to use nested loops letting both dx and dy range from -1 to 1, and skipping the case of (0, 0).  [**Update:** I've changed the code to use this approach.]
- The (dx, dy) logic for populating each "leg" of a "loop".

In retrospect I wonder if I'd have been better off coding Part 1 instead of doing the math on paper.  I could then have modified the working code to solve Part 2.  Total time to solve both might have been faster.


## Thoughts the morning after

- In Python it would have been trivial to implement the grid as a dictionary mapping (x, y) tuples to integers.  That approach would not quite work in Swift, because (Int, Int) is not Hashable and therefore cannot be a dictionary key.  One approach would be to create a struct called `Point` to use as the dictionary key.  This would have required implementing a hash function and an `==` operator.  There's sample code in Apple's Swift docs that does exactly this.  Another approach would be to use nested dictionaries: an outer dictionary whose keys are x coordinates and whose values are dictionaries.  The inner dictionaries would map y coordinates to cell values.  These approaches are easy enough, just a few lines of code, but they feel like drudge work compared to Python's built-in ability to use tuples of integers as dictionary keys.

- Speaking of drudgery, it was a pain thinking through the logic for populating cells in the correct order.  I was doing it with four separate loops, one for each side of the square whose perimeter I was populating.  This felt like I was thinking through more nitty-gritty than I should have to.  In the morning it occurred to me I could have written a function like `nextXY(_ x: Int, _ y: Int) -> (Int, Int)` that for any point in the grid would give the coordinates of the next cell in the spiral.

- Okay, having written the above notes I went ahead and wrote a Python solution.  It was definitely less painful for my brain to write that `nextXY` function than the leg-by-leg logic I'd written in my original solution, even though both approaches require tedious thinking-through of edge cases.  Using Python helped things go smoothly for sure: it was really nice implementing the grid as a simple dictionary (no additional code needed, hence no grumbling about having to write that code), and it was really nice having my code execute with no compilation delay.  Still, I'm going to stick with Swift for the time being.

