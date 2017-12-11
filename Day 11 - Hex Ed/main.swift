// See the README for an explanation of the logic here.

let xyOffsets = [
	"n": (0, 1),
	"ne": (1, 1),
	"se": (1, 0),
	"s": (0, -1),
	"sw": (-1, -1),
	"nw": (-1, 0)
]

var childX = 0
var childY = 0
var furthestEver = 0

func minStepsToChild() -> Int {
	// Hm, there's no sign function in Swift AFAIK.
	if childX * childY > 0 {
		// Northeast or southwest quadrant.
		return max(abs(childX), abs(childY))
	} else {
		// Northwest or southeast quadrant.
		return abs(childX) + abs(childY)
	}
}

let inputSteps = inputLines[0].split(separator: ",").map { String($0) }
for step in inputSteps {
	// Have the child take a step.
	let (dx, dy) = xyOffsets[step]!
	childX += dx
	childY += dy

	// See if the child has set a new distance record.
	furthestEver = max(furthestEver, minStepsToChild())
}

func solve1() {
	print(minStepsToChild())
}

func solve2() {
	print(furthestEver)
}

solve1()
solve2()

