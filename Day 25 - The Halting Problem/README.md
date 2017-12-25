# Advent of Code 2017, Day 25

The last AoC puzzle of 2017!  This one was light and fun, a nice low-stress way to wrap things up.

To represent state transitions I used a named tuple typealiased to `Transition`.  I could have done the same for the `State` type, but made that a struct instead.  It was originally a class, and by the time it occurred to me it could be a tuple, I didn't feel like spending the few seconds to convert it.

I spent most of my time on the parsing of the input.  In retrospect, it would have been faster to hand-transcribe it into a bunch of tuples, considering how few states are defined in the input.  On the plus side, the code I wrote should work with anyone's input, not just mine.

Here's what the hand-transcribing approach would have been:

```swift
typealias Transition = (newValue: Int, dir: Int, next: String)
typealias State = (name: String, zeroCase: Transition, oneCase: Transition)

let A: State = ("A", (1, 1, "B"), (0, -1, "C"))
let B: State = ("B", (1, -1, "A"), (1, 1, "D"))
let C: State = ("C", (1, 1, "A"), (0, -1, "E"))
let D: State = ("D", (1, 1, "A"), (0, 1, "B"))
let E: State = ("E", (1, -1, "F"), (1, -1, "C"))
let F: State = ("F", (1, 1, "D"), (1, 1, "A"))

let statesByName = ["A": A, "B": B, "C": C, "D": D, "E": E, "F": F]
```

After deleting all the other stuff I wouldn't have needed, my code would have been 49 lines instead of 76.

One thing I spaced out on was clicking the one last link needed to complete my Advent of Code.  I knew from previous years that there was no actual puzzle for Part 2, but I forgot to click that link.

I'm already looking forward to next year!

