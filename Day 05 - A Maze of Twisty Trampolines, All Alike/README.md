# Advent of Code 2017, Day 5

Made a lot of sloppy mistakes on this one.

I almost submitted my answer to Part 1 without bothering to test, but I stopped myself and tested with the example data.  Sure enough, my output was wrong.  Even after I "fixed" my code, when I submitted my real answer to Part 1, it was still wrong.

Last year I was more careful to test with the example data until it spat out the right answer.  For non-trivial problems it can also be worth adding intermediate `printf` statements and checking that the outputs match the walkthrough given in the problem description.

One of my sloppy mistakes was that I was using global variables to store the input and didn't reset them between calling `solve1()` and `solve2()`.  That had me scratching my head over Part 2, because surely it was a trivial, foolproof modification to Part 1, right?  How could my code possibly be wrong?

Another source of bugs tonight was being too hasty to believe I understood the specifications.  That's a pitfall to avoid in any dev situation.  AoC is a good way to practice understanding the specs.

Realized I could have created the `offsets` array more concisely.  I did it like this:

```swift
var offsets = [Int]()
for line in inputLines {
	offsets.append(Int(line)!)
}
```

This would have been simpler:

```swift
var offsets = inputLines.map({ Int($0)! })
```

