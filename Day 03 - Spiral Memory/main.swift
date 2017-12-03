import Foundation

let inputNum = Int(inputLines.first!)!

class Grid {
	let radius = 300
	var cells = [[Int]]()  // Will be square grid with sides 2*radius+1.
	let threshold: Int

	init(threshold: Int) {
		self.threshold = threshold
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

	func populateCell(_ x: Int, _ y: Int) -> Int {
		var value = 0
		for (dx, dy) in [(1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0), (-1, -1), (0, -1), (1, -1)] {
			value += self[x + dx, y + dy]
		}
		self[x, y] = value
		return value
	}

	// Fills in the perimeter of the square with edge size 2*loopNumber + 1, starting with the square
	// just to the right of the bottom right cell with edge size 2*loopNumber + 1.
	// Exits if and when cell value > threshold.
	// The first loop is prefilled (the "1" in the center, which forms a 1x1 square).
	// The loop after that (3x3 square) has loopNumber = 1.
	func populateLoop(_ loopNumber: Int) -> Int? {
		var x = loopNumber
		var y = -(loopNumber - 1)
		for dy in 0..<2*loopNumber {
			let value = populateCell(x, y + dy)
			if value > threshold { return value }
		}
		x -= 1
		y += 2*loopNumber - 1
		for dx in 0..<2*loopNumber {
			let value = populateCell(x - dx, y)
			if value > threshold { return value }
		}
		x -= 2*loopNumber - 1
		y -= 1
		for dy in 0..<2*loopNumber {
			let value = populateCell(x, y - dy)
			if value > threshold { return value }
		}
		x += 1
		y -= 2*loopNumber - 1
		for dx in 0..<2*loopNumber {
			let value = populateCell(x + dx, y)
			if value > threshold { return value }
		}
		return nil
	}

	func populateUntilAnswer() {
		for loopNumber in 1...300 {
			if let answer = populateLoop(loopNumber) {
				print(answer)
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
}

func solve1() {
	// Solved this by hand, but will see about coding it after I do Part 2.
}

func solve2() {
	let grid = Grid(threshold: inputNum)
	grid.populateUntilAnswer()
}

solve1()
solve2()

