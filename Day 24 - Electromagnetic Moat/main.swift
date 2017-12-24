// NOTE: This is not the code I originally used to solve Day 24.  That code was
// annoyingly messy, so I rewrote it to be less messy.


// Represent a collection of distinct "ports" (as defined by the Day 24 puzzle
// description) as a graph of unique integer values.  Each edge corresponds to a
// "port", with the port's pin counts given by the two connected vertices.  A
// "bridge" thus corresponds to a path in the graph starting at the node with
// value 0.
//
// Note that it is possible to have an edge between a vertex and itself, for
// example a port like "2/2" or "15/15".
class Graph {
	var edgeMap = [Int: Set<Int>]()
	var maxBridgeStrength = 0
	var maxBridgeLength = 0
	var maxBridgeStrengthForMaxBridgeLength = 0
	
	init(inputLines: [String]) {
		for line in inputLines {
			let portPins = line.split(separator: "/").map { Int($0)! }
			addEdge(portPins[0], portPins[1])
		}
	}
	
	func addEdge(_ n1: Int, _ n2: Int) {
		func connect(from a: Int, to b: Int) {
			if var connections = edgeMap[a] {
				connections.insert(b)
				edgeMap[a] = connections
			} else {
				edgeMap[a] = Set([b])
			}
		}
		
		connect(from: n1, to: n2)
		connect(from: n2, to: n1)
	}
	
	func removeEdge(_ n1: Int, _ n2: Int) {
		func disconnect(from a: Int, to b: Int) {
			if var connections = edgeMap[a] {
				connections.remove(b)
				edgeMap[a] = connections
			}
		}
		
		disconnect(from: n1, to: n2)
		disconnect(from: n2, to: n1)
	}
	
	func containsEdge(_ n1: Int, _ n2: Int) -> Bool {
		guard let connections = edgeMap[n1] else { return false }
		return connections.contains(n2)
	}
	
	// To avoid double-counting, only add pairs a/b where a<=b.
	func edgeCount() -> Int {
		var count = 0
		for (a, connections) in edgeMap {
			for b in connections {
				if a <= b { count += 1 }
			}
		}
		return count
	}
	
	// Add up the pin counts of all the "ports".  To avoid double-counting,
	// only add pairs a/b where a<=b.  We have to include the case where
	// a==b, because the graph can contain an edge from a node to itself.
	// The input can contain a "port" that is, for example, 15/15.
	func strength() -> Int {
		var s = 0
		for (a, connections) in edgeMap {
			for b in connections {
				if a <= b { s += a + b }
			}
		}
		return s
	}
	
	// Uses depth-first traversal to traverse all possible paths in the graph.
	func visitAllPossiblePaths(startingAt a: Int, edgesAlreadyTraversed: Graph) {
		var didRecurse = false
		for b in edgeMap[a]! {
			if !edgesAlreadyTraversed.containsEdge(a, b) {
				edgesAlreadyTraversed.addEdge(a, b)
				visitAllPossiblePaths(startingAt: b, edgesAlreadyTraversed: edgesAlreadyTraversed)
				edgesAlreadyTraversed.removeEdge(a, b)
				
				didRecurse = true
			}
		}
		
		// If we've reached a node where we can't continue the path any further,
		// then edgesAlreadyTraversed contains a candidate for the "bridge" with
		// the maximum possible strength, which is what we need for Part 1.
		// It's also a candidate for the longest possible bridge, which we need
		// for Part 2.
		if !didRecurse {
			let bridgeStrength = edgesAlreadyTraversed.strength()
			maxBridgeStrength = max(maxBridgeStrength, bridgeStrength)
			
			let bridgeLength = edgesAlreadyTraversed.edgeCount()
			if bridgeLength > maxBridgeLength {
				maxBridgeLength = bridgeLength
				maxBridgeStrengthForMaxBridgeLength = bridgeStrength
			} else if bridgeLength == maxBridgeLength {
				maxBridgeStrengthForMaxBridgeLength = max(maxBridgeStrengthForMaxBridgeLength, bridgeStrength)
			}
		}
	}
	
}

let g = Graph(inputLines: inputLines)
g.visitAllPossiblePaths(startingAt: 0, edgesAlreadyTraversed: Graph(inputLines: []))

func solve1() {
	print(g.maxBridgeStrength)
}

func solve2() {
	print(g.maxBridgeStrengthForMaxBridgeLength)
}

solve1()
solve2()

