class KnotHashInfo {
	private(set) var circList: [Int]
	private let lengths: [Int]

	var curr = 0
	var skip = 0

	init(circListSize: Int, lengths: [Int]) {
		self.circList = Array(0 ..< circListSize)
		self.lengths = lengths
	}

	func part1Pass(log: Bool = false) {
		for len in lengths {
			if log { printCircList(len: len) }  // before
			var rev = [Int]()
			for i in 0..<len {
				rev.append(circList[(curr + i) % circList.count])
			}
			rev.reverse()
			for i in 0..<len {
				circList[(curr + i) % circList.count] = rev[i]
			}
			if log { printCircList(len: len) }  // after

			curr = (curr + len + skip) % circList.count
			skip += 1
		}
		if log { printCircList(len: nil) }  // final
	}

	func printCircList(len: Int?) {
		var s = ""
		for (i, n) in circList.enumerated() {
			var part = (i == curr ? "[\(n)]" : "\(n)")
			if let len = len {
				if i == curr { part = "(" + part }
				if i == ((curr+len) % circList.count) - 1 { part += ")" }
			}
			part += " "
			s += part
		}
		print(s)
	}
}

func part2Lengths(_ line: String) -> [Int] {
	var lengths = [Int]()
	for c in line {
		lengths.append(Int(c.unicodeScalars[c.unicodeScalars.startIndex].value))  // ASCII
	}
	return lengths + [17, 31, 73, 47, 23]
}

// Expects 256 numbers, returns 16 numbers.
func denseHash(_ nums: [Int]) -> [Int] {
	var dense = [Int]()
	for blockNum in 0..<16 {
		let block = nums[16*blockNum ..< 16*(blockNum + 1)]
		let reduced = block.reduce(0, { $0 ^ $1 })
		dense.append(reduced)
	}
	return dense
}

func knotHash(_ input: String) -> String {
	let lengths = part2Lengths(input)
	let puz = KnotHashInfo(circListSize: 256, lengths: lengths)

	// Convert to sparse hash.
	for _ in 0..<64 {
		puz.part1Pass()
	}

	// Convert to dense hash.
	let dense = denseHash(puz.circList)

	// Convert to hex string.
	return dense.reduce("", { $0 + String(format: "%02x", $1) })
}

