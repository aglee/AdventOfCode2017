# Advent of Code 2017, Day 6

Did this one in Python.  As I read the puzzle description I quickly saw that using Swift was going to take too long, at least with my level of proficiency.  I needed a set of lists of integers, and I'm not aware of a quick way to do that in Swift.  In Python it's trivial; the language naturally supports that data structure.

Recently, while doing some old AoC puzzles for practice, I ran into a Swift gotcha regarding the `%` operator.  Swift returns -1 and not 3 for `-1 % 4`.  I don't understand the reasoning, but apparently the decision was to make `%` a [**remainder** operator](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html) in Swift rather than a **modulo** operator.  I took a moment to double-check that Python doesn't do the same, because I was going to be using `%` on array indexes.  Later I realized it was irrelevant for this puzzle, as I wasn't going to have any negative values.  But good to know for the future.

Another thing I needed was to find both the max value in a list and the first index at which that value occurs.  I suspected there might be a one-liner for this in Python, and sure enough I found [this](https://stackoverflow.com/questions/6193498/pythonic-way-to-find-maximum-value-and-its-index-in-a-list) on Stack Overflow:

```python
import operator
index, value = max(enumerate(my_list), key=operator.itemgetter(1))
```

Afterwards I revisited the Stack Overflow page and saw that someone had [compared](https://stackoverflow.com/questions/6193498/pythonic-way-to-find-maximum-value-and-its-index-in-a-list/6194580#6194580) the above approach to this hand-rolled function that does the same thing:

```python
def explicit(l):
	max_val = max(l)
	max_idx = l.index(max_val)
	return max_idx, max_val
```

Surprisingly, the hand-rolled function was faster, at least on his machine.  Fortunately, execution time wasn't an issue for this AoC exercise.

