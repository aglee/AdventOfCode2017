# Advent of Code 2017, Day 10

Part 1 took a few iterations of testing and debugging with the example input.  It was initially all top-level variables and functions, which I moved into a class for Part 2.

I spent time writing a print function to try to replicate exactly the examples given in the puzzle description.  Maybe it would have been quicker to set breakpoints and examine values in the debugger; not sure.  Feels like it was kind of a compulsive thing to need to print, say, the exact string `2 1) 0 ([3] 4` to feel confident my code was correct.

Early logic error: in the case of a wrap-around selection, I was reversing each of the two parts individually.  My fix for that could have been more concise and efficient, but the way I did it, with a temporary array, was easy for me to read.

I did no testing for Part 2 except for a quick sanity check of the `part2Lengths` function.  It seemed like it would take a lot of time to test all the intermediate steps, each of which was *pretty* easy to code.  Rather than invest that time, I took a chance and submitted my answer, and it turned out to be correct.  If it had been wrong, I wouldn't have been able to submit another answer for 60 seconds, and it would almost certainly have taken longer than that to fix my code anyway.

If I'd done this in Python I could have used the convenient `ord()` function to get ASCII values.  I believe this is easier in Swift 4 than it was in Swift 3, but I didn't bother looking up how to do it.  I knew the input would only be digits and commas, and the puzzle description gave the example of `1,2,3` becoming `49,44,50,44,51`.  I used that information to code my own ASCII conversion.

