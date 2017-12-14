import Foundation

func makeNodeID(_ row: Int, _ col: Int) -> String { return "\(row),\(col)" }

class Node {
	var id: String
//	var connections = [Node]()
	var connectedIDs = Set<String>()

	init(_ id: String) { self.id = id }

	func addConnection(_ otherID: String) {
		if !connectedIDs.contains(otherID) {
			connectedIDs.insert(otherID)
		}
	}

//	func addConnection(_ node: Node) {
//		if !hasConnection(node.id) {
//			connections.append(node)
//			connectedIDs.insert(node.id)
//		}
//	}
//
//	func hasConnection(_ otherID: String) -> Bool {
//		return connectedIDs.contains(otherID)
//	}
}

class GraphInfo {
	var nodesByID = [String: Node]()

	// Each string in gridStrings assumed to be 128 characters that are "0" or "1".
	init(_ gridStrings: [String]) {
		let grid = gridStrings.map({ Array($0).map({ String($0) }) })
		for row in 0..<grid.count {
			for col in 0..<128 {
				if grid[row][col] == "0" { continue }
				let id1 = makeNodeID(row, col)
				let node = nodeWithID(id1)  // This is important because makes sure Node gets created even if zero neighbors.

				for (deltaRow, deltaCol) in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
					if row + deltaRow >= 0
						&& row + deltaRow < 128
						&& col + deltaCol >= 0
						&& col + deltaCol < 128
						&& grid[row + deltaRow][col + deltaCol] == "1"
					{
						let id2 = makeNodeID(row + deltaRow, col + deltaCol)
						nodeWithID(id2).addConnection(id1)
						node.addConnection(id2)
					}
				}
			}
		}
	}

	func idsGroupedWith(_ startID: String) -> Set<String> {
		var visitedIDs = Set<String>()
		var queue = [startID]
		while true {
			if queue.count == 0 {
				return(visitedIDs)
			}

			let id = queue.removeFirst()
			visitedIDs.insert(id)
			for otherID in nodeWithID(id).connectedIDs {
				if !visitedIDs.contains(otherID) {
					queue.append(otherID)
				}
			}
		}
	}

	func numRegions() -> Int {
		var unvisitedIDs = Set(nodesByID.keys.sorted())  // Sort to help debugging -- "0,0" will be first.
		var numGroups = 0
		while true {
			if unvisitedIDs.count == 0 {
				return numGroups
			}

			numGroups += 1
			let id = unvisitedIDs.removeFirst()
			let groupIDs = idsGroupedWith(id)
			unvisitedIDs.subtract(groupIDs)
		}
	}

	func nodeWithID(_ id: String) -> Node {
		if let node = nodesByID[id] {
			return node
		} else {
			let node = Node(id)
			nodesByID[id] = node
			return node
		}
	}
}


