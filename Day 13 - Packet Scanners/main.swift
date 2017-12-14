import Foundation

// This code has been modified since I originally used it for the AoC puzzle.

class Firewall {
	var layerRanges = [(depth: Int, range: Int)]()

	init(_ lines: [String]) {
		for line in lines {
			let parts = line.components(separatedBy: ": ")
			let depth = Int(parts[0])!
			let range = Int(parts[1])!
			self.layerRanges.append((depth, range))
		}
	}

	// The packet will be "caught" at depth d iff (d+delay) is a multiple of
	// 2*(range-1) -- because that is the periodicity at which that layer's
	// scanner will have returned to position 0.
	//
	// It may help to visualize the delay by imagining empty depths (with no
	// layer) that the packet goes through before entering the firewall.
	//
	// Reason for wasCaught is that there could be a trip where the packet was
	// caught ONLY in layer 0.  In that case tripSeverity would be 0 but they
	// would still have been caught.
	func tripSeverity(delay: Int = 0) -> Int {
		var tripSeverity = 0
		for (depth, range) in layerRanges {
			// Check if we're "caught" in this layer.
			if (depth + delay) % (2 * (range - 1)) == 0 {
				tripSeverity += depth * range
			}
		}
		return tripSeverity
	}

	func isCaught(delay: Int = 0) -> Bool {
		for (depth, range) in layerRanges {
			// Check if we're "caught" in this layer.
			if (depth + delay) % (2 * (range - 1)) == 0 {
				return true
			}
		}
		return false
	}
}

func solve1() {
	let f = Firewall(inputLines)
	print(f.tripSeverity())
}

func solve2() {
//	let f = Firewall(testInputLines)
//	print(f.tripSeverity(delay: 4))  // wasCaught is true despite tripSeverity being 0.
//	print(f.tripSeverity(delay: 10))  // Now wasCaught is false.

	let f = Firewall(inputLines)
	var delay = 0
	while true {
		delay += 1
		if f.isCaught(delay: delay) == false {
			print(delay)
			return
		}
	}
}

solve1()
//NSLog("start part 2")
solve2()
//NSLog("end part 2")

