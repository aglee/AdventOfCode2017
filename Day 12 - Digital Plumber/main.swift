import Foundation

class Node {
	var id: Int
	var connections = [Node]()
	var connectedIDs = Set<Int>()

	init(_ id: Int) { self.id = id }

	func addConnection(_ node: Node) {
		if !hasConnection(node.id) {
			connections.append(node)
			connectedIDs.insert(node.id)
		}
	}

	func hasConnection(_ otherID: Int) -> Bool {
		return connectedIDs.contains(otherID)
	}
}

class Puzzle {
	var nodesByID = [Int: Node]()

	init(_ lines: [String]) {
		for line in lines {
			let parts = line.components(separatedBy: " <-> ").map { String($0) }
			let programID = Int(parts[0])!
			let connectedIDs = parts[1].components(separatedBy: ", ").map { Int($0)! }

			for conn in connectedIDs {
				nodeWithID(programID).addConnection(nodeWithID(conn))
				nodeWithID(conn).addConnection(nodeWithID(programID))
			}
		}
	}

	func idsGroupedWith(_ startID: Int) -> Set<Int> {
		var visitedIDs = Set<Int>()
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

	func part1() {
		print(idsGroupedWith(0).count)
	}

	func part2() {
		var unvisitedIDs = Set(nodesByID.keys)
		var numGroups = 0
		while true {
			if unvisitedIDs.count == 0 {
				print(numGroups)
				return
			}

			numGroups += 1
			let id = unvisitedIDs.removeFirst()
			let groupIDs = idsGroupedWith(id)
			unvisitedIDs.subtract(groupIDs)
		}
	}

	func nodeWithID(_ id: Int) -> Node {
		if let node = nodesByID[id] {
			return node
		} else {
			let node = Node(id)
			nodesByID[id] = node
			return node
		}
	}
}

let puz = Puzzle(inputLines)

func solve1() {
	puz.part1()
}

func solve2() {
	puz.part2()
}

solve1()
solve2()

