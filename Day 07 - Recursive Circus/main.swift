class Tower {
	var name = "NAME_HERE"
	var weight = -1
	var children = [Tower]()
	var parent: Tower?
	var treeWeight = -1
	var normalTreeWeight = -1

	var depth: Int { return parent == nil ? 0 : parent!.depth + 1 }

	// Recursively calculate the weight of the subtree rooted at this node.
	func updateTreeWeight() {
		for child in children { child.updateTreeWeight() }
		treeWeight = weight + children.reduce(0, { $0 + $1.treeWeight })
	}
}

var towersByName = [String: Tower]()

func towerWithName(_ name: String) -> Tower {
	if let tower = towersByName[name] {
		return tower
	} else {
		let tower = Tower()
		tower.name = name
		towersByName[name] = tower
		return tower
	}
}

for line in inputLines {
	let line =
		line.replacingOccurrences(of: ",", with: "")
			.replacingOccurrences(of: "(", with: "")
			.replacingOccurrences(of: ")", with: "")
			.replacingOccurrences(of: "-> ", with: "")
	let parts = line.split(separator: " ").map({ String($0) })
	let tower = towerWithName(parts[0])
	tower.weight = Int(parts[1])!
	for i in 2..<parts.count {
		let child = towerWithName(parts[i])
		tower.children.append(child)
		child.parent = tower
	}
}

let root = towersByName.values.first(where: { $0.parent == nil })!
root.updateTreeWeight()

func solve1() {
	print(root.name)
}

func solve2() {
	func findOddball(_ nodes: [Tower]) -> Tower? {
		// We are looking for cases where there are 3 or more elements in the
		// list.  If there are only 2 elements, either one of them could be the
		// answer, and we've been told there's a unique answer.
		if nodes.count < 3 { return nil }

		// Figure out what treeWeight most of the nodes have.  We can infer it
		// from the first three nodes in the list.
		let normalTreeWeight: Int
		if nodes[0].treeWeight == nodes[1].treeWeight {
			normalTreeWeight = nodes[0].treeWeight
		} else {
			normalTreeWeight = nodes[2].treeWeight
		}

		// See if there is a node that doesn't match that "normal" weight.
		if let oddball = nodes.first(where: { $0.treeWeight != normalTreeWeight }) {
			oddball.normalTreeWeight = normalTreeWeight
			return oddball
		}
		return nil
	}

	// Find all nodes that are candidates for the answer.
	var candidates = [Tower]()
	for t in towersByName.values {
		if let oddball = findOddball(t.children) {
			candidates.append(oddball)
		}
	}

	// The answer is whichever node in that list is deepest in the tree.
	let deepest = candidates.max(by: { $0.depth < $1.depth })!
	print(deepest.weight + (deepest.normalTreeWeight - deepest.treeWeight))
}

solve1()
solve2()

