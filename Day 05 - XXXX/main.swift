import Foundation

func solve1() {
	var offsets = [Int]()
	for line in inputLines {
		offsets.append(Int(line)!)
	}
	var i = 0
	var numJumps = 0
	while true {
		if i < 0 || i >= offsets.count {
			print(numJumps)
			return
		}
		let origI = i
		i += offsets[origI]
		offsets[origI] += 1
		numJumps += 1
	}
}

func solve2() {
	var offsets = [Int]()
	for line in inputLines {
		offsets.append(Int(line)!)
	}
	var i = 0
	var numJumps = 0
	while true {
		if i < 0 || i >= offsets.count {
			print(numJumps)
			return
		}
		let origI = i
		i += offsets[origI]

		// Here's the difference between Part 1 and Part 2.
		if offsets[origI] >= 3 {
			offsets[origI] -= 1
		} else {
			offsets[origI] += 1
		}

		numJumps += 1
	}
}

solve1()
solve2()

