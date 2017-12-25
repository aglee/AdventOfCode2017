import Foundation

extension String {
	var lastWord: String {
		let lastPart = self.split(separator: " ").last! as NSString
		
		// Remove the last character, which is always punctuation we don't want.
		return lastPart.substring(to: lastPart.length - 1)
	}
	
	// "Perform a diagnostic checksum after 6 steps." would return 6.
	var numSteps: Int {
		let parts = self.split(separator: " ").map { String($0) }
		return Int(parts[parts.count - 2])!
	}
}

// - val is 0 or 1
// - dir is -1 for left, 1, for right
// - next is name of next state
typealias Transition = (newValue: Int, dir: Int, next: String)

struct State {
	let name: String
	let zeroCase: Transition
	let oneCase: Transition
}

var statesByName = [String: State]()
let input = inputLines  // inputLines or testInputLines
var initialStateName = input[0].lastWord
let numSteps = input[1].numSteps

for lineNum in stride(from: 3, to: input.count, by: 10) {
	let stateName = input[lineNum].lastWord
	let zeroCase = (newValue: Int(input[lineNum + 2].lastWord)!,
					dir: (input[lineNum + 3].lastWord == "left" ? -1 : 1),
					next: input[lineNum + 4].lastWord)
	let oneCase = (newValue: Int(input[lineNum + 6].lastWord)!,
				   dir: (input[lineNum + 7].lastWord == "left" ? -1 : 1),
				   next: input[lineNum + 8].lastWord)
	statesByName[stateName] = State(name: stateName, zeroCase: zeroCase, oneCase: oneCase)
}

class Tape {
	var cursorPos = 0
	var indexesOfOnes = Set<Int>()
	var currentState = statesByName[initialStateName]!
	
	// Returns the value at the cursor position.
	func read() -> Int {
		return indexesOfOnes.contains(cursorPos) ? 1 : 0
	}
	
	// Expects value to be 0 or 1.
	func write(_ value: Int) {
		if value == 1 {
			indexesOfOnes.insert(cursorPos)
		} else {
			indexesOfOnes.remove(cursorPos)
		}
	}
	
	func step() {
		let transition = (read() == 0 ? currentState.zeroCase : currentState.oneCase)
		write(transition.newValue)
		cursorPos += transition.dir
		currentState = statesByName[transition.next]!
	}
}

let t = Tape()
for _ in 0..<numSteps {
	t.step()
}
print(t.indexesOfOnes.count)

