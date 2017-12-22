// "Abstract" class.  Concrete subclasses are GridPartOne and GridPartTwo.
//
// Uses Cartesian coordinates (y increases in the upward direction) and puts
// (0, 0) at the center of the input grid.  I thought this would be easier for
// debugging than (row, col) coordinates, but I was wrong.
class Grid {
	// Key is a string with coordinates of an unclean node (e.g. "12,-7").
	// Value is "#", "W", or "F" (the last two only in Part 2).
	var uncleanNodeStates = [String: String]()
	
	// List of movement directions in clockwise order (up, right, down, left).
	let allDirections = [(0, 1), (1, 0), (0, -1), (-1, 0)]

	// Index into the allDirections array indicating which direction the virus
	// is facing.  Starts facing up.
	var directionIndex = 0

	// Current virus location.
	var currentX = 0
	var currentY = 0
	
	// The number we're computing to solve the puzzle.
	var numBurstsThatCausedInfection = 0
	
	init(_ inputLines: [String]) {
		assert(inputLines.count % 2 == 1, "Input grid does not have odd number of rows.")
		let inputRadius = inputLines.count / 2
		
		// Find all the infected points.
		// Awkward translation here between (row, col) and (x, y).
		for (row, line) in inputLines.enumerated() {
			assert(line.count == inputLines.count, "Input grid is not perfectly square.")
			let chars = Array(line).map { String($0) }
			for (col, ch) in chars.enumerated() {
				if ch != "." {
					let pointString = p2s(col - inputRadius, inputRadius - row)
					uncleanNodeStates[pointString] = ch
				}
			}
		}
	}
	
	// I used +3 instead of -1 because in Swift `%` is remainder, not modulo.
	func turnLeft() { directionIndex = (directionIndex + 3) % 4 }
	
	func turnRight() { directionIndex = (directionIndex + 1) % 4 }
	
	func reverseDirection() { directionIndex = (directionIndex + 2) % 4 }
	
	func moveForward() {
		let (dx, dy) = allDirections[directionIndex]
		currentX += dx
		currentY += dy
	}

	// Pseudo-abstract method.  Crashes if not overridden.
	func burst() { fatalError("Must override burst() method.") }
	
	func run(numBursts: Int, debugLog: Bool = false) {
		if debugLog {
			print("---- START, dir = \(allDirections[directionIndex]) ----")
			dump(radius: 4)
		}
		for i in 1...numBursts {
			self.burst()
			
			if debugLog {
				print("---- \(i), dir = \(allDirections[directionIndex]) ----")
				dump(radius: 4)
			}
		}
		print(numBurstsThatCausedInfection)
	}
	
	func p2s(_ x: Int, _ y: Int) -> String { return "\(x),\(y)" }
	
	// Printing for debugging purposes.
	func dump(radius: Int) {
		// Awkward (row, col) to (x, y) translation.
		for y in stride(from: radius, through: -radius, by: -1) {
			var line = ""
			for x in -radius...radius {
				if let nodeState = uncleanNodeStates[p2s(x, y)] {
					line += nodeState
				} else {
					line += "."
				}
				
				if (x, y) == (currentX, currentY) {
					line += ["^", ">", "v", "<"][directionIndex]
				} else {
					line += " "
				}
				
//				line += " "
			}
			print(line)
//			print()
		}
		print()
		print()
	}
}

// In Part 1 the only unclean node state is "#", meaning infected.
class GridPartOne: Grid {
	override func burst() {
		let pointString = p2s(currentX, currentY)
		if let _ = uncleanNodeStates[pointString] {
			// Node is infected.  Turn right and clean it.
			turnRight()
			uncleanNodeStates[pointString] = nil
		} else {
			// Node is clean.  Turn left and infect it.
			turnLeft()
			uncleanNodeStates[pointString] = "#"
			numBurstsThatCausedInfection += 1
		}
		
		moveForward()
	}
}

// In Part 2 there are three possible unclean node states:
// - "W" means weakened.
// - "#" means infected.
// - "F" means flagged.
class GridPartTwo: Grid {
	override func burst() {
		let pointString = p2s(currentX, currentY)
		if let nodeState = uncleanNodeStates[pointString] {
			// Node is unclean.
			switch nodeState {
			case "W":
				// If it is weakened, it does not turn.
				uncleanNodeStates[pointString] = "#"  // Weakened nodes become infected.
				numBurstsThatCausedInfection += 1
			case "#":
				turnRight()  // If it is infected, it turns right.
				uncleanNodeStates[pointString] = "F"  // Infected nodes become flagged.
			case "F":
				reverseDirection()  // If it is flagged, it reverses direction.
				uncleanNodeStates[pointString] = nil  // Flagged nodes become clean.
			default: fatalError()
			}
		} else {
			// Node is clean.
			turnLeft()  // If it is clean, it turns left.
			uncleanNodeStates[pointString] = "W"  // Clean nodes become weakened.
		}
		
		moveForward()
	}
}

func solve1() {
//	GridPartOne(testInputLines).run(numBursts: 10_000)
	GridPartOne(inputLines).run(numBursts: 10_000)
}

func solve2() {
	GridPartTwo(inputLines).run(numBursts: 10_000_000)
}

solve1()
solve2()

