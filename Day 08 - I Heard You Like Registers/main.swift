class Machine {
	var regValues = [String: Int]()
	var maxRegValueEver = Int.min
	var maxRegValueNow: Int { return regValues.values.max()! }

	func valueForReg(_ regName: String) -> Int {
		if let value = regValues[regName] {
			return value
		} else {
			regValues[regName] = 0
			return 0
		}
	}

	func run(_ lines: [String]) {
		for line in lines {
			// Parse the instruction.
			let parts = line.split(separator: " ").map({ String($0) })
			let regName = parts[0]
			let deltaOp = parts[1]
			let deltaValue = Int(parts[2])!
			let condRegName = parts[4]  // Skipping the word "if".
			let compOp = parts[5]
			let compValue = Int(parts[6])!

			// Execute the instruction.
			if compIsTrue(condRegName, compOp, compValue) {
				applyDelta(regName, deltaOp, deltaValue)
			}
		}
	}

	func applyDelta(_ regName: String, _ deltaOp: String, _ deltaValue: Int) {
		let regValue = valueForReg(regName)
		switch deltaOp {
		case "inc": regValues[regName] = regValue + deltaValue
		case "dec": regValues[regName] = regValue - deltaValue
		default: fatalError("Unexpected instruction '\(deltaOp)'.")
		}
		if valueForReg(regName) > maxRegValueEver {
			maxRegValueEver = valueForReg(regName)
		}
	}

	func compIsTrue(_ condRegName: String, _ compOp: String, _ compValue: Int) -> Bool {
		let condRegValue = valueForReg(condRegName)
		switch compOp {
		case ">": return condRegValue > compValue
		case "<": return condRegValue < compValue
		case ">=": return condRegValue >= compValue
		case "<=": return condRegValue <= compValue
		case "==": return condRegValue == compValue
		case "!=": return condRegValue != compValue
		default: fatalError("Unexpected comparison operator '\(compOp)'.")
		}
	}
}

let m = Machine()
//m.run(testInputLines)
m.run(inputLines)

func solve1() {
	print(m.maxRegValueNow)
}

func solve2() {
	print(m.maxRegValueEver)
}

solve1()
solve2()

