
// This approach uses the fact that the input is 16 numbers, each of
// which fit comfortably in 4 bits, and always will due to the nature
// of the redistribution algorithm.  Thus we can represent the banks
// array as a single 64-bit integer, and can easily insert that in a
// Swift set.


var banks = inputLines.first!.split(separator: "\t").map({ Int($0)! })
//var banks = [0, 2, 7, 0]

func hashOfBanks() -> Int64 {
	var h: Int64 = 0
	for v in banks {
		h <<= 4
		h |= Int64(v)
	}
	return h
}

var seen = Set<Int64>()
seen.insert(hashOfBanks())

func distrib() {
	let maxValue = banks.max()!
	let index = banks.index(of: maxValue)!
	banks[index] = 0
	for i in 0..<maxValue {
		banks[(index + i + 1) % banks.count] += 1
	}
}

func solve1() {
	var steps = 0
	while true {
		steps += 1
		distrib()
		let h = hashOfBanks()
		if seen.contains(h) {
			print(steps)
			return
		} else {
			seen.insert(h)
		}
	}
}

func solve2() {
	seen.removeAll()
	seen.insert(hashOfBanks())
	solve1()
}

solve1()
solve2()

