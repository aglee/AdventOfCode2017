import Foundation

// inputLines contains the input data, an array of strings.

let inputNum = Int(inputLines.first!)!

class Grid {
	let radius = 300
	var cells = [[Int]]()  // Will be square grid with sides 2*radius+1.

	init() {
		let gridWidth = 2*radius + 1
		for _ in 0..<gridWidth {
			let row = Array<Int>(repeating: 0, count: gridWidth)
			cells.append(row)
		}
		self[0, 0] = 1
	}

	// The center of the grid is at (x, y) = (0, 0).
	// x increases rightward, y upwards (Cartesian).
	subscript(_ x: Int, _ y: Int) -> Int {
		get { return cells[y + radius][x + radius] }
		set { cells[y + radius][x + radius] = newValue }
	}

	// Fills in the perimeter of the square with edge size 2*loopNumber + 1,
	// starting with the square just to the right of the bottom right cell with
	// edge size 2*loopNumber + 1.
	// The first loop is prefilled (the "1" in the center, which forms a 1x1 square).
	// The loop after that (3x3 square) has loopNumber = 1.
	func populateLoop(_ loopNumber: Int) -> (x: Int, y: Int, value: Int)?
	{
		var x = loopNumber
		var y = -(loopNumber - 1)
		for dy in 0..<2*loopNumber {
			let value = populateCell(x, y + dy)
			if isDesiredValue(value) { return (x, y + dy, value) }
		}
		x -= 1
		y += 2*loopNumber - 1
		for dx in 0..<2*loopNumber {
			let value = populateCell(x - dx, y)
			if isDesiredValue(value) { return (x - dx, y, value) }
		}
		x -= 2*loopNumber - 1
		y -= 1
		for dy in 0..<2*loopNumber {
			let value = populateCell(x, y - dy)
			if isDesiredValue(value) { return (x, y - dy, value) }
		}
		x += 1
		y -= 2*loopNumber - 1
		for dx in 0..<2*loopNumber {
			let value = populateCell(x + dx, y)
			if isDesiredValue(value) { return (x + dx, y, value) }
		}
		return nil
	}

	func populateUntilAnswer() {
		for loopNumber in 1...radius {
			if let (x, y, value) = populateLoop(loopNumber) {
				printTheAnswer(x: x, y: y, value: value)
				return
			}
		}
	}

	func printGridAfterLoopNumber(_ loopNumber: Int) {
		for y in stride(from: loopNumber, through: -loopNumber, by: -1) {
			for x in -loopNumber...loopNumber {
				print("\(self[x, y])\t", terminator: "")
			}
			print()
		}
	}

	// MARK: - Subclasses implement these as needed to solve Part 1 or Part 2

	func populateCell(_ x: Int, _ y: Int) -> Int {
		fatalError("Must implement populateCell().")
	}

	func isDesiredValue(_ value: Int) -> Bool {
		fatalError("Must implement isDesiredValue().")
	}
	
	func printTheAnswer(x: Int, y: Int, value: Int) {
		fatalError("Must implement printTheAnswer().")
	}
}

class GridPart1: Grid {
	private var numCellsFilled = 1  // Grid starts with the cell at (0, 0) prefilled.

	override func populateCell(_ x: Int, _ y: Int) -> Int {
		numCellsFilled += 1
		self[x, y] = numCellsFilled
		return numCellsFilled
	}

	override func isDesiredValue(_ value: Int) -> Bool {
		return value == inputNum
	}

	override func printTheAnswer(x: Int, y: Int, value: Int) {
		print(abs(x) + abs(y))
	}
}

class GridPart2: Grid {
	override func populateCell(_ x: Int, _ y: Int) -> Int {
		var value = 0
		for dx in -1...1 {
			for dy in -1...1 {
				if (dx, dy) == (0, 0) { continue }
				value += self[x + dx, y + dy]
			}
		}
		self[x, y] = value
		return value
	}

	override func isDesiredValue(_ value: Int) -> Bool {
		return value > inputNum
	}

	override func printTheAnswer(x: Int, y: Int, value: Int) {
		print(value)
	}
}

func solve1() {
	GridPart1().populateUntilAnswer()
}

func solve2() {
	GridPart2().populateUntilAnswer()
}

solve1()
solve2()

