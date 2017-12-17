
//import Foundation


class Spinlock {
	let numSteps: Int
	var buffer = [0]
	var pos = 0

	init(numSteps: Int) {
		self.numSteps = numSteps
	}

	func move(value: Int) {
		pos = (pos + numSteps) % buffer.count
		buffer.insert(value, at: pos + 1)
		pos = (pos + 1) % buffer.count
	}

	func dump() {
		var s = ""
		for (i, value) in buffer.enumerated() {
			if i == pos {
				s += " (\(value))"
			} else {
				s += " \(value)"
			}
		}
		print(s)
	}
}

//let spin = Spinlock(numSteps: 3)

func solve1() {
	let spin = Spinlock(numSteps: Int(inputLines[0])!)
	for i in 1...2017 {
		spin.move(value: i)
	}
	let idx = (spin.pos + 1) % spin.buffer.count
	print(spin.buffer[idx])
}

func solve2() {
//	let spin = Spinlock(numSteps: Int(inputLines[0])!)
//	for i in 1...50_000_000 {
//		if i % 100_000 == 0 { print(i) }
//		spin.move(value: i)
//	}
//	print(spin.buffer[1])


	let numSteps = Int(inputLines[0])!
	var buflen = 1
	var pos = 0
	var answer = -1
	for i in 1...50_000_000 {
		pos = (pos + numSteps) % buflen
		if pos == 0 { answer = i }
		buflen += 1
		pos = (pos + 1) % buflen
	}
	print(answer)
}

solve1()
solve2()

