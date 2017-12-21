# Advent of Code 2017, Day 21

I represented grids as strings, just like in the puzzle description.  This made them easy to use as dictionary keys.

I manually calculated rotations and flips.  I'm sure there's a clever way to do it with matrix arithmetic, but my matrix arithmetic is pretty hazy, and it was simple enough to do by hand for 2x2 and 3x3 matrices.  The transforms didn't have to be very efficient, since they're only used to set up the rules at the beginning.  That was key.  I didn't want to be rotating and flipping the **data** to find the matching rule.  Much faster to rotate and flip the **rules** up front, and add the resulting variations to the rule set.

A bug I ran into was that I didn't add all the necessary rule variations.  I added all rotations and flips of the original rules as given in the input data, but I neglected to add all **combinations** of rotations and flips.  I realized this when the program crashed because it couldn't find a matching rule.

I wondered if the pixel pattern produced by Part 2 would look like anything.  To my eye it didn't seem to, but that doesn't mean there isn't a hidden meaning, perhaps related to the name of the puzzle, "Fractal Art".

