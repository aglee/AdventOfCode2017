
//import Foundation

func bitify(_ hexString: String) -> String {
	var s = ""
	let chars = Array(hexString).map { String($0) }
	for i in 0..<hexString.count {
		let n = Int(chars[i], radix: 16)!
		var bin = String(n, radix: 2)
		while bin.count < 4 { bin = "0" + bin }
//		bin = bin.replacingOccurrences(of: "0", with: ".")
//		bin = bin.replacingOccurrences(of: "1", with: "#")
		s += bin
	}
	return s
}

//let x = knotHash("flqrgnkx-2")
//test(x)

func gridBitStrings(_ key: String) -> [String] {
	var strings = [String]()
	for row in 0..<128 {
		let s = key + "-" + String(row)
		let kh = knotHash(s)
		strings.append(bitify(kh))
	}
	return strings
}

func squaresUsed(_ strings: [String]) -> Int {
	var numUsed = 0
	for s in strings {
		numUsed += Array(s).filter({ $0 == "1" }).count
	}
	return numUsed
}

//let keyString = testInputLines[0]
let keyString = inputLines[0]
let gridStrings = gridBitStrings(keyString)

func solve1() {
	print(squaresUsed(gridStrings))
}

func solve2() {
	let g = GraphInfo(gridStrings)
	print(g.numRegions())
}

solve1()
solve2()

