import Foundation

var dancers = [String]()
var inputMoves = [String]()

func spin(_ num: Int) {
	dancers =
		Array(dancers[dancers.count - num ..< dancers.count]
			+ dancers[0 ..< dancers.count - num])
}

func exchange(_ position1: Int, _ position2: Int) {
	(dancers[position1], dancers[position2]) = (dancers[position2], dancers[position1])
}

func partner(_ name1: String, _ name2: String) {
	exchange(dancers.index(of: name1)!, dancers.index(of: name2)!)
}

func apply(move: String) {
	let type = (move as NSString).substring(to: 1) as String
	let parts = ((move as NSString).substring(from: 1) as String).split(separator: "/")

	switch type {
	case "s": spin(Int(parts[0])!)
	case "x":
		let a = Int(parts[0])!
		let b = Int(parts[1])!
		exchange(a, b)
	case "p":
		let a = String(parts[0])
		let b = String(parts[1])
		partner(a, b)
	default: fatalError()
	}
}

func movesFromLine(_ line: String) -> [String] {
	return line.split(separator: ",").map({ String($0) })
}

func applyMoves() {
	for move in inputMoves {
		apply(move: move)
//		print(dancers.joined())
	}
}

func solve1() {
//	dancers = Array("abcde").map({ String($0) })
//	inputMoves = ["s1", "x3/4","pe/b"]
	dancers = Array("abcdefghijklmnop").map({ String($0) })
	inputMoves = movesFromLine(inputLines[0])
	applyMoves()
	print(dancers.joined())
}

func solve2() {
	let initialDancers = "abcdefghijklmnop"
	dancers = Array(initialDancers).map({ String($0) })
	inputMoves = movesFromLine(inputLines[0])
	var cycle = -1
	for i in 1 ..< 10_000_000 {
		applyMoves()
		if dancers.joined() == initialDancers {
			cycle = i
			break
		}
	}

	dancers = Array(initialDancers).map({ String($0) })
	for _ in 0 ..< (1_000_000_000 % cycle) {
		applyMoves()
	}
	print(dancers.joined())
}

solve1()
solve2()

