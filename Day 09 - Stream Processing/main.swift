
//import Foundation

class Group {
	var children = [Group]()
	var parent: Group?
	var score = 1

	// Recursively calculate the score of the subtree rooted at this node.
	func updateScore() {
		if let p = parent {
			score = p.score + 1
		} else {
			score = 1
		}
		for child in children { child.updateScore() }
	}

	func totalScores() -> Int {
		var total = self.score
		for child in children {
			total += child.totalScores()
		}
		return total
	}
}

func solve1(_ inputString: String) -> (Int,Int) {
	var garbageCount = 0

	let charStream = inputString.map({ String($0) })
	var stack = [Group]()
	var root: Group? = nil
	var i = 0
	var garbage = false
	while true {
		if i >= charStream.count { break }
		let c = charStream[i]

		if garbage && c != "!" && c != ">" {
			garbageCount += 1
		}

		if c == "!" {
			i += 1
		} else if c == "{" {
			// Begin group unless in garbage.
			if !garbage {
				let g = Group()
				if let top = stack.last {
					top.children.append(g)
					g.parent = top
				} else {
					root = g
				}
				stack.append(g)  // g is new top of stack.
			}
		} else if c == "}" {
			// End group unless in garbage.
			if !garbage {
				let _ = stack.removeLast()
			}
		} else if c == "<" {
			// Begin garbage.
			garbage = true
		} else if c == ">" {
			// End garbage.
			garbage = false
		}

		i += 1
	}

	if let root = root {
		root.updateScore()
		return (root.totalScores(), garbageCount)
	} else {
		return (0, garbageCount)
	}
}

func test1() {
	let test = [
		"{}",
		"{{{}}}",
		"{{},{}}",
		"{{{},{},{{}}}}",
		"{<a>,<a>,<a>,<a>}",
		"{{<ab>},{<ab>},{<ab>},{<ab>}}",
		"{{<!!>},{<!!>},{<!!>},{<!!>}}",
		"{{<a!>},{<a!>},{<a!>},{<ab>}}"
	]
	for s in test {
		let (totalScores, _) = solve1(s)
		print(totalScores)
	}
}
//test1()

func test2() {
	let test = [
		"<>",
		"<random characters>",
		"<<<<>",
		"<{!>}>",
		"<!!>",
		"<!!!>>",
		"<{o\"i!a,<{i<a>"
	]
	for s in test {
		let (_, garbageCount) = solve1(s)
		print(garbageCount)
	}
}
//test2()


let (totalScores, garbageCount) = solve1(inputLines[0])

func solve1() {
	print(totalScores)
}

func solve2() {
	print(garbageCount)
}

solve1()
solve2()

