# Notes on Advent of Code 2017, Day 4

Most of the work in my solution is done by the Swift standard libraries:

- I didn't have to write logic to count duplicates; I converted an Array to a Set and let that weed out the duplicates for me.
- I didn't have to write my own logic to detect anagrams by somehow representing the distribution of letters in a word; I used a built-in function to sort strings and used *that* as my representation.

This reminds me of the [Day 2](/Day%2002%20-%20Corruption%20Checksum/discussion.md) puzzle where I realized after the fact that instead of scanning a collection to find min and max, I could have used the built-in sorting function and allowed that to do the work for me.

