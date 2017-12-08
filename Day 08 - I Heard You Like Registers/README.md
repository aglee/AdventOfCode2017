# Advent of Code 2017, Day 8

I started putting everything in global variables and functions, then at some point wrapped it all in a class called `Machine`.  I thought Part 2 might need me to reload the input data and start from scratch, and I figured I'd accomplish that by creating a fresh instance of `Machine`.  That turned out not to be needed, but the encapsulating didn't cost me much time.  I surrounded the global stuff with `class Machine { ... }` and it just worked.  I suspect Swift was designed to make it that easy.

I remembered this time to test both Part 1 and Part 2 on the example code.  To that end, I added a variable to `input.swift` called `testInputLines`.

There's probably a more concise and clever way of mapping the strings `">"`, `">="`, `"=="` etc. to their corresponding `(Int,Int)->Bool` functions.  I started to think about that, but decided for my purposes it was quick enough to code a `switch` statement, with the help of copy and paste.

It's convenient to be able to put `fatalError()` in branches that should never be executed, especially in functions that return a value.  I don't have to add a bogus `return` statement -- the compiler knows not to warn me about the function possibly not returning a value.  I've been putting informative messages in `fatalError()` calls, but I just realized that's unnecessary time spent typing.  I can just put a breakpoint there, which is more helpful for debugging anyway.

Experience helps.  I had a little bit of muscle memory from previous Advent of Code puzzles that had a similar conceptual model of registers and instructions.  Also I noticed a recurring pattern which is the need for a registry of named things, where a thing should automatically be added if one doesn't already exist for a given name.  In tonight's code the registry looked like this:

```swift
var regValues = [String: Int]()
func valueForReg(_ regName: String) -> Int {
	if let value = regValues[regName] {
		return value
	} else {
		regValues[regName] = 0
		return 0
	}
}
```

I saved a little time (I think) by copying this code pattern from a previous AoC exercise.

