import Foundation

class Point {
	var x: Int
	var y: Int
	var z: Int
	
	// Manhattan distance.
	var manh: Int { return abs(x) + abs(y) + abs(z) }
	
	// Return something unique and hashable that we can use in a Set.
	var id: String { return "\(x),\(y),\(z)" }
	
	init(_ x: Int, _ y: Int, _ z: Int) {
		(self.x, self.y, self.z) = (x, y, z)
	}
	
	func add(_ otherPoint: Point) {
		self.x += otherPoint.x
		self.y += otherPoint.y
		self.z += otherPoint.z
	}
}

class Particle: CustomStringConvertible {
	var pos: Point
	var vel: Point
	let acc: Point
	
	init(_ line: String) {
		// E.g. "p=< 3,0,0>".
		func pointFromString(_ s: String) -> Point {
			let numsString = (s as NSString).substring(with: NSRange(location: 3, length: s.count - 4))
			let coords = numsString.trimmingCharacters(in: .whitespaces).split(separator: ",").map { Int($0)! }
			return Point(coords[0], coords[1], coords[2])
		}
		
		let threeParts = line.components(separatedBy: ", ")
		self.pos = pointFromString(threeParts[0])
		self.vel = pointFromString(threeParts[1])
		self.acc = pointFromString(threeParts[2])
	}
	
	func tick() {
		vel.add(acc)
		pos.add(vel)
	}
	
	var description: String {
		return "p=<\(pos.x),\(pos.y),\(pos.z)>"
			+ ", v=<\(vel.x),\(vel.y),\(vel.z)>"
			+ ", a=<\(acc.x),\(acc.y),\(acc.z)>"
	}
}

class Cloud {
	var particles: [Particle]
	
	init(_ inputLines: [String]) {
		particles = inputLines.map { Particle($0) }
	}
	
	// Keep ticking until all particles are either moving away from the origin
	// or not moving at all.  The latter case is highly unlikely but I feel
	// compelled to check for it anyway.
	func tickUntilNoneMovingCloserToOrigin(removeCollisions: Bool = false) {
		if removeCollisions { removeCollidingParticles() }
		while true {
			var numParticlesThatNeedMoreTicks = 0
			for p in particles {
				let oldDistance = p.pos.manh
				p.tick()
				let newDistance = p.pos.manh
				if newDistance < oldDistance {
					// The particle moved toward the origin.  It will need at
					// least one more tick before it's moving away from the origin.
					numParticlesThatNeedMoreTicks += 1
				} else if newDistance == oldDistance
					&& (p.vel.manh != 0 || p.acc.manh != 0)
				{
					// The particle's distance from the origin didn't change,
					// but it will move on the next tick, so let's wait and see
					// then whether it moves toward the origin.
					numParticlesThatNeedMoreTicks += 1
				}
			}
			if removeCollisions { removeCollidingParticles() }
			if numParticlesThatNeedMoreTicks == 0 { return }
		}
	}
	
	func removeCollidingParticles() {
		// Construct lookup dictionary.  Key is string uniquely identifying a
		// position.  Value is set of array indexes of particles at that position.
		var positionMap = [String: Set<Int>]()
		for (i, p) in particles.enumerated() {
			let posID = p.pos.id
			if let _ = positionMap[posID] {
				positionMap[posID]?.insert(i)
			} else {
				let setOfArrayIndexes = Set([i])
				positionMap[posID] = setOfArrayIndexes
			}
		}
		
		// Find all positions with only one particle, and only keep those particles.
		var newParticles = [Particle]()
		for posID in positionMap.keys {
			if positionMap[posID]!.count == 1 {
				let arrayIndex = positionMap[posID]!.first!
				newParticles.append(particles[arrayIndex])
			}
		}
		particles = newParticles
	}
	
	func dump() {
		for (i, p) in particles.enumerated() { print("\(i): \(p)") }
	}
}

func solve1() {
	let cloud = Cloud(inputLines)  // Use inputLines or testInputLines.
	cloud.tickUntilNoneMovingCloserToOrigin()
	
	// Find the particle with the smallest acceleration.  Since all particles
	// are now moving away from the origin, they will all eventually out-distance
	// this particle, permanently, no matter how far it may be from the origin
	// right now.
	//
	// If two particles have the same acceleration, choose the one with the
	// smaller position.  We assume from the problem statement that the input
	// has exactly one answer, so this algorithm should be good enough.
	var minIndex = -1
	var minAcc = Int.max
	var minPos = Int.max
	for (i, p) in cloud.particles.enumerated() {
		if p.acc.manh < minAcc
			|| (p.acc.manh == minAcc && p.pos.manh < minPos) {
			minIndex = i
			minAcc = p.acc.manh
			minPos = p.pos.manh
		}
	}
	print(minIndex)
}

func solve2() {
	// I have a feeling that in theory this could be wrong, because even though
	// I tick long enough for all particles to be exploding away from the origin,
	// it seems to me two of them might be on the same vector, with one of them
	// accelerating fast enough to catch the other.  In practice, though, this
	// gave me the right answer.
	let cloud = Cloud(inputLines)  // Use inputLines or testInputLines.
	cloud.tickUntilNoneMovingCloserToOrigin(removeCollisions: true)
	print(cloud.particles.count)
}

solve1()
solve2()

