
//import Foundation

class Puzzle {
	let inputSteps: [String]
	let xyOffsets = [
		"n": (0, 1),
		"ne": (1, 1),
		"se": (1, 0),
		"s": (0, -1),
		"sw": (-1, -1),
		"nw": (-1, 0)
	]

	var childPos: (x: Int, y: Int) = (0, 0)
	var furthestEver = 0

	init(_ inputLine: String) {
		inputSteps = inputLine.split(separator: ",").map { String($0) }
	}

	func childWalk() {
		for step in inputSteps {
			let (dx, dy) = xyOffsets[step]!
			childPos = (childPos.x + dx, childPos.y + dy)

			let steps = minStepsToChild()
			if steps > furthestEver { furthestEver = steps }
		}
//		print(childPos)
	}

	func minStepsToChild() -> Int {
		let (x, y) = (abs(puz.childPos.x), abs(puz.childPos.y))
		return max(x, y)
	}
}

//let puz = Puzzle("ne,ne,ne")
//let puz = Puzzle("ne,ne,sw,sw")
//let puz = Puzzle("ne,ne,s,s")
//let puz = Puzzle("se,sw,se,sw,sw")
let puz = Puzzle(inputLines[0])
puz.childWalk()

func solve1() {
	print(puz.minStepsToChild())
}

func solve2() {
	print(puz.furthestEver)
}

solve1()
solve2()

