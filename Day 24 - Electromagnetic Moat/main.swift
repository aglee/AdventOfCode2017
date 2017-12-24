//// Confirming they're all distinct.
//var portStrings = Set<String>()
//for line in inputLines {
//	let portPins = line.split(separator: "/").map { Int($0)! }
//	let minPort = min(portPins[0], portPins[1])
//	let maxPort = max(portPins[0], portPins[1])
//	let s = "\(minPort),\(maxPort)"
//	
//	if portStrings.contains(s) {
//		()
//	}
//	portStrings.insert(s)
//}
//print(portStrings.count)

class Node {
	var value: Int
	var connectedNodes = [Node]()
	var connectedValues = Set<Int>()
	
	init(_ value: Int) { self.value = value }
	
	func connect(_ otherNode: Node) {
		if connectedValues.contains(otherNode.value) { fatalError() }
		connectedNodes.append(otherNode)
		connectedValues.insert(otherNode.value)
	}
}

var nodesByValue = [Int: Node]()

func nodeWithValue(_ value: Int) -> Node {
	if let node = nodesByValue[value] {
		return node
	} else {
		let node = Node(value)
		nodesByValue[value] = node
		return node
	}
}

for line in inputLines {  // testInputLines or inputLines
	let portPins = line.split(separator: "/").map { Int($0)! }
	let nodeA = nodeWithValue(portPins[0])
	let nodeB = nodeWithValue(portPins[1])
	nodeA.connect(nodeB)
	if (nodeA.value != nodeB.value) {
		nodeB.connect(nodeA)
	}
}

func connectionString(_ nodeA: Node, _ nodeB: Node) -> String {
	let minValue = min(nodeA.value, nodeB.value)
	let maxValue = max(nodeA.value, nodeB.value)
	return "\(minValue)/\(maxValue)"
}

func strength(using connections: Set<String>) -> Int {
	var result = 0
	for conn in connections {
		let pins = conn.split(separator: "/").map { Int($0)! }
		result += pins[0] + pins[1]
	}
	return result
}

var maxStrengthPerDepth = [Int: Int]()

var part2Answer = 0

// Note that it is possible to traverse (once) a connection between a Node and
// itself, e.g. the port "2/2" is represented as a connection between the Node
// with value 2 and itself.  The way we use "connectionsAlreadyUsed" will track
// that case.
func maxStrength(startNode: Node, connectionsAlreadyUsed: Set<String>, requiredDepth: Int) -> Int {

	
	var maxStrengthSoFar = 0
	for node in startNode.connectedNodes {
		let conn = connectionString(startNode, node)
		if !connectionsAlreadyUsed.contains(conn) {
			var usedConnections = connectionsAlreadyUsed
			usedConnections.insert(conn)
			let candidateStrength = startNode.value + node.value + maxStrength(startNode: node, connectionsAlreadyUsed: usedConnections, requiredDepth: requiredDepth)
			if candidateStrength > maxStrengthSoFar {
				maxStrengthSoFar = candidateStrength
			}

		
			if usedConnections.count == requiredDepth {
				part2Answer = max(part2Answer, strength(using: usedConnections))
			}
			
		}
	}
	return maxStrengthSoFar
}

func maxDepth(startNode: Node, connectionsAlreadyUsed: Set<String>) -> Int {
	var maxDepthSoFar = 0
	for node in startNode.connectedNodes {
		let conn = connectionString(startNode, node)
		if !connectionsAlreadyUsed.contains(conn) {
			var usedConnections = connectionsAlreadyUsed
			usedConnections.insert(conn)
			let candidateDepth = 1 + maxDepth(startNode: node, connectionsAlreadyUsed: usedConnections)
			if candidateDepth > maxDepthSoFar {
				maxDepthSoFar = candidateDepth
			}
		}
	}
	return maxDepthSoFar
}

func solve1() {
//	print(maxStrength(startNode: nodeWithValue(0), connectionsAlreadyUsed: Set<String>(), requiredDepth: -1))
}

func solve2() {
	let maxD = maxDepth(startNode: nodeWithValue(0), connectionsAlreadyUsed: Set<String>())
	let _ = maxStrength(startNode: nodeWithValue(0), connectionsAlreadyUsed: Set<String>(), requiredDepth: maxD)
	print(part2Answer)
}

solve1()
solve2()

