class Routing {
	var grid = [[String]]()
	var row = 0
	var col = 0
	var drow = 1
	var dcol = 0  // At any time, either drow or dcol is 0, and the other is 1 or -1.
	var letters = ""
	var nonEmptyCellsVisited = 0

	init(_ lines: [String]) {
		for line in lines {
			grid.append(Array(line).map { String($0) })
		}
		for (i, ch) in grid[0].enumerated() {
			if ch == "|" {
				col = i
				break
			}
		}
	}

	// Either:
	// - moves forward one in the current direction
	// - changes direction and then moves
	// - cannot move (returns false)
	//
	// The input grid is conveniently pre-padded all around with spaces, so no
	// need for bounds checking.
	func move() -> Bool {
		let ch = grid[row][col]

		// See if we've reached the end.
		if ch == " " { return false }

		// Record this visit to a non-empty cell.
		nonEmptyCellsVisited += 1
		
		// Change direction if needed.
		if ch == "+" {
			if drow == 0 {
				// We were moving horizontally, so new direction is either up or down.
				drow = (grid[row + 1][col] == " " ? -1 : 1)
				dcol = 0
			} else {
				// We were moving vertically, so new direction is either right or left.
				drow = 0
				dcol = (grid[row][col + 1] == " " ? -1 : 1)
			}
		}

		// If we're on a letter, collect it.
		if !["|", "-", "+", " "].contains(ch) { letters += ch }

		// Advance in the current direction.
		(row, col) = (row + drow, col + dcol)
		
		return true
	}
}

let routing = Routing(inputLines)
while routing.move() { }

func solve1() {
	print(routing.letters)
}

func solve2() {
	print(routing.nonEmptyCellsVisited)
}

solve1()
solve2()

