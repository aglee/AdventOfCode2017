# Advent of Code 2017

This directory contains my solutions to the 25-day [Advent of Code 2017](http://adventofcode.com/2017).  I'll be trying to solve as many as I can in Swift 4, but if I run into trouble I may switch to some other language.  My plan is for each day to have its own subdirectory, containing these files:

- `part1-problem.md`, `part2-problem.md`.  Descriptions of the day's two puzzles (Part 1 and Part 2), copied from the AoC website.  The way it works is, Part 2 is a twist on Part 1 that is disclosed after you've entered the correct answer to Part 1.
- `main.swift`.  My solution logic, in the form of a `solve1()` function for Part 1 and a `solve2()` function for Part 2.  If the code gets big and unwieldy I'll split it across additional `.swift` files.  The main logic, though, must be in `main.swift`, and I expect to always use functions called `solve1()` and `solve2()`.
- `input.swift`.  The input data, in the form of a global string array variable called `inputLines`.  The same input data is used for both Part 1 and Part 2.  Different AoC users get different input data, so if you explore other people's AoC repositories their input will likely not match mine.
- `answers.swift`.  String variables containing the correct answers for Part 1 and Part 2, assuming I'm able to find them out by solving the day's puzzles.  I figure at some point I might want to set up some kind of automated regression testing.
- `README.md` (optional).  I'm thinking this could be a place for general discussion of obstacles I encountered and things I learned.  I may or may not get around to creating this file for any given day.

My AoC code usually starts quick and dirty.  In particular, I'll often start Part 2 by copy-pasting the `solve1()` code into `solve2()`.  To varying degrees I will come back and clean the code up, but my priority will be whatever it takes to get the correct answer as fast as I can.

I've been using [CodeRunner](https://coderunnerapp.com/) to code, run, and debug these programs.  [**Update:** I've switched to Xcode for Swift coding.  More about this in my [Day 3 notes](/Day%2003%20-%20Spiral%20Memory/README.md).]  If you don't have CodeRunner you can run them from the command line, after `cd`-ing to that day's directory:

```bash
# Swift
swiftc -o main *.swift && ./main
```

```bash
# Python
python MyFile.py
```

```bash
# Objective-C
xcrun clang -fobjc-arc -framework Foundation -ObjC -o MyFile.out MyFile.m
MyFile.out
```

TODO: Add instructions for running Java from the command line.  Add instructions for using homebrew to install Java (my preference).

TODO: Figure out how to invoke the debugger from the command line, and add instructions here.

Links on the AoC website look like this:

- Problem description: <http://adventofcode.com/2017/day/1>.
- Input data: <http://adventofcode.com/2017/day/1/input>.


## Tips

TODO: Add notes on AoC in general, how it works, more tips.

- Beware accidental add trailing newlines in the input.txt files.
	- In Python, can strip trailing newlines before splitting the file into lines:
		```python
		return [line.rstrip('\n') for line in open(filePath)]
		```
	- In Swift, can use `where` as a loop condition:
		```swift
		for line in lines where !line.isEmpty {
		```



