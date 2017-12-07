class Tower: CustomStringConvertible {
	var name = "NAME_HERE"
	var weight = -1
	var children = [Tower]()
	var parent: Tower?
	var treeWeight = -1

	var depth: Int {
		if let parent = parent {
			return parent.depth + 1
		} else {
			return 0
		}
	}

	func updateTreeWeight() {
		if children.count == 0 {
			treeWeight = weight
			return
		}

		for child in children {
			child.updateTreeWeight()
		}
		treeWeight = weight  // Our own weight is included in the total.
		for child in children {
			treeWeight += child.treeWeight
		}
	}

	var description: String {
		if children.count == 0 {
			return "(\(name), \(weight), \(treeWeight))"
		} else {
			return "(\(name), \(weight), \(treeWeight), \(children.map({ $0.name })))"
		}
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

// Recursively calculate the treeWeight for every node in the tree.
var root: Tower!
for t in towersByName.values {
	if t.parent == nil {
		root = t
		break
	}
}
root.updateTreeWeight()

func printOutline(_ t: Tower) {
	var s = ""
	for _ in 0..<t.depth { s += "\t" }
	s += "\(t.name) \(t.treeWeight)"
	print(s)
	for child in t.children {
		printOutline(child)
	}
}

printOutline(root!)

func solve1() {
	print(root.name)
}

func solve2() {
	var candidates = Set<String>()
	for t in towersByName.values {
		guard let parent = t.parent else { continue }
		if parent.children.count < 2 { continue }
		let firstWeight = parent.children.first!.treeWeight
		for child in parent.children {
			if child.treeWeight != firstWeight {
				candidates.insert(child.name)
			}
		}
	}
	for name in candidates {
		let t = towerWithName(name)
		print(Array(t.parent!.children.map({($0.name, $0.weight, $0.treeWeight, $0.depth, $0.parent!.name)})))
	}
}

solve1()
solve2()

