import Foundation

extension String {
	func sub(_ pos: Int, _ length: Int) -> String {
		return (self as NSString).substring(with: NSRange(location: pos, length: length))
	}
}

// We use strings to represent grids of "pixels".
extension String {
	var numOn: Int { return Array(self).filter{ $0 == "#" }.count }
	var rowStrings: [String] { return self.split(separator: "/").map { String($0) } }
	
	var rotatedRight: String {
		let rows = rowStrings.map { Array($0).map { String($0) } }
		if rows.count == 2 {
			return rows[1][0] + rows[0][0]
				+ "/" + rows[1][1] + rows[0][1]
		} else if rows.count == 3 {
			return rows[2][0] + rows[1][0] + rows[0][0]
				+ "/" + rows[2][1] + rows[1][1] + rows[0][1]
				+ "/" + rows[2][2] + rows[1][2] + rows[0][2]
		} else {
			fatalError()
		}
	}
	
	var flippedHorizontal: String {
		let rows = rowStrings.map { Array($0).map { String($0) } }
		if rows.count == 2 {
			return rows[0][1] + rows[0][0]
				+ "/" + rows[1][1] + rows[1][0]
		} else if rows.count == 3 {
			return rows[0][2] + rows[0][1] + rows[0][0]
				+ "/" + rows[1][2] + rows[1][1] + rows[1][0]
				+ "/" + rows[2][2] + rows[2][1] + rows[2][0]
		} else {
			fatalError()
		}
	}
	
	var flippedVertical: String {
		let parts = self.split(separator: "/").map { String($0) }
		let rows = parts.map { Array($0).map { String($0) } }
		if rows.count == 2 {
			return rows[1][0] + rows[1][1]
				+ "/" + rows[0][0] + rows[0][1]
		} else if rows.count == 3 {
			return rows[2][0] + rows[2][1] + rows[2][2]
				+ "/" + rows[1][0] + rows[1][1] + rows[1][2]
				+ "/" + rows[0][0] + rows[0][1] + rows[0][2]
		} else {
			fatalError()
		}
	}
	
	func printAsGrid() {
		for row in rowStrings { print(row) }
	}
}

//let s = ".#./..#/###"
//s.flippedHorizontal.printAsGrid()
//s.rotatedRight.printAsGrid()
//s.flippedVertical.printAsGrid()

var rules = [String: String]()

func loadRules(_ ruleLines: [String]) {
	rules.removeAll()
	for line in ruleLines {
		let parts = line.components(separatedBy: " => ")
		var lhs = parts[0]
		let rhs = parts[1]
		
		// Add all combinations of rotating and flipping.
		for _ in 0..<4 {
			lhs = lhs.rotatedRight
			rules[lhs] = rhs
			rules[lhs.flippedHorizontal] = rhs
			rules[lhs.flippedVertical] = rhs
		}
	}
}

class Grid {
	var gridRows = [String]()
	var numPixelsOn: Int { return gridRows.reduce(0, { $0 + $1.numOn }) }

	// Returns a string representation of a sub-grid.  Assumes valid input that
	// won't go out of bounds.
	func getSquare(size: Int, cornerRow: Int, cornerCol: Int) -> String {
		var rows = [String]()
		for i in 0..<size {
			rows.append(gridRows[cornerRow + i].sub(cornerCol, size))
		}
		return rows.joined(separator: "/")
	}
	
	// It's expected we'll call this in a loop that fills the grid with squares
	// from top to bottom, left to right.
	func putSquare(s: String, startingRow: Int) {
		let squareRows = s.rowStrings
		
		// Add empty rows if necessary.
		if startingRow == gridRows.count {
			for _ in 0..<squareRows.count { gridRows.append("") }
		} else if startingRow > gridRows.count {
			fatalError()
		}
		
		// Append the given square rows to the indicated grid rows.
		for i in 0..<squareRows.count {
			gridRows[startingRow + i] += squareRows[i]
		}
	}
	
	func enhancedGrid() -> Grid {
		let newGrid = Grid()
		let squareSize = ((gridRows.count % 2 == 0) ? 2 : 3)
		let newSquareSize = squareSize + 1  // We're told every rule's rhs is 1 bigger than lhs.
		for row in stride(from: 0, to: gridRows.count, by: squareSize) {
			for col in stride(from: 0, to: gridRows.count, by: squareSize) {
				let oldSquare = getSquare(size: squareSize, cornerRow: row, cornerCol: col)
				guard let rhs = rules[oldSquare] else { fatalError() }
				newGrid.putSquare(s: rhs, startingRow: (row / squareSize) * newSquareSize)
			}
		}
		return newGrid
	}
	
	func dump() { for row in gridRows { print(row) } }
}

func solve(iterations: Int) {
	var g = Grid()
	g.putSquare(s: ".#./..#/###", startingRow: 0)
	for _ in 0..<iterations {
		g = g.enhancedGrid()
	}
	print(g.numPixelsOn)
}

func solve1() {
	loadRules(inputLines)
	solve(iterations: 5)
}

func solve2() {
	loadRules(inputLines)
	solve(iterations: 18)
}

solve1()
solve2()

