class Gen {
	var value: Int
	let factor: Int
	let pickiness: Int

	init(value: Int, factor: Int, pickiness: Int) {
		self.value = value
		self.factor = factor
		self.pickiness = pickiness
	}

	func generateNext() {
		value = (value * factor) % 2147483647
	}

	func pickyGenerateNext() {
		while true {
			generateNext()
			if value % pickiness == 0 { break }
		}
	}
}

let lines = inputLines  // testInputLines or inputLines
let valueA = Int(lines[0].split(separator: " ").last!)!
let valueB = Int(lines[1].split(separator: " ").last!)!

func isMatch(_ a: Gen, _ b: Gen) -> Bool {
	let sixteenOnes = (1<<16) - 1
	return ((a.value & sixteenOnes) == (b.value & sixteenOnes))
}

func solve1() {
	let genA = Gen(value: valueA, factor: 16807, pickiness: 4)
	let genB = Gen(value: valueB, factor: 48271, pickiness: 8)
	var numMatches = 0
	for _ in 0 ..< 40_000_000 {
		genA.generateNext()
		genB.generateNext()
		if isMatch(genA, genB) { numMatches += 1 }
	}
	print(numMatches)
}

func solve2() {
	let genA = Gen(value: valueA, factor: 16807, pickiness: 4)
	let genB = Gen(value: valueB, factor: 48271, pickiness: 8)
	var numMatches = 0
	for _ in 0 ..< 5_000_000 {
		genA.pickyGenerateNext()
		genB.pickyGenerateNext()
		if isMatch(genA, genB) { numMatches += 1 }
	}
	print(numMatches)
}

solve1()
solve2()

