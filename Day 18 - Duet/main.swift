enum State {
	case waitingToStart
	case running
	case waitingToReceive
	case terminated
}

class Program2 {
	var commands = [[String]]()
	var pc = 0
	var state: State = .waitingToStart

	var regValues = [String: Int]()
	var sndCount = 0

	var otherProgram: Program2!
	var queue = [Int]()  // append to push, removeFirst to pop

	init(programID: Int, lines: [String]) {
		regValues["p"] = programID
		for line in lines {
			let parts = line.split(separator: " ").map({ String($0) })
			commands.append(Array(parts))
		}
	}

	func valueForReg(_ reg: String) -> Int {
		if let value = regValues[reg] {
			return value
		} else {
			regValues[reg] = 0
			return 0
		}
	}

	func valueForParam(_ param: String) -> Int {
		if param == "" { fatalError() }
		if let value = Int(param) {
			return value
		} else {
			return valueForReg(param)
		}
	}

	// On exit, state is either .waiting or .terminated.
	func run() {
		state = .running
		while true {
			if pc < 0 || pc >= commands.count {
				state = .terminated
				return
			}

			let cmd = commands[pc]
			let instr = cmd[0]
			let x = cmd[1]
			let y = ((cmd.count == 3) ? cmd[2] : "")

			switch instr {
			case "snd":
				otherProgram.queue.append(valueForParam(x))
				sndCount += 1
			case "set": regValues[x] = valueForParam(y)
			case "add": regValues[x] = valueForParam(x) + valueForParam(y)
			case "mul": regValues[x] = valueForParam(x) * valueForParam(y)
			case "mod": regValues[x] = valueForParam(x) % valueForParam(y)
			case "rcv":
				if queue.count == 0 {
					state = .waitingToReceive
					return
				} else {
					regValues[x] = queue.removeFirst()
				}
			case "jgz":
				if valueForParam(x) > 0 {
					pc += valueForParam(y) - 1  // Subtract 1 because we'll add 1 in a moment.
				}
			default: fatalError("Unexpected instruction '\(instr)'.")
			}

			pc += 1
		}
	}
}

let t0 = Program2(programID: 0, lines: inputLines)  // testInputLines or inputLines
let t1 = Program2(programID: 1, lines: inputLines)  // testInputLines or inputLines
t0.otherProgram = t1
t1.otherProgram = t0

var (curr, other) = (t0, t1)
while true {
	curr.run()
	if other.state == .terminated {
		break
	}
	if other.state == .waitingToReceive && other.queue.count == 0 {
		break
	}
	(curr, other) = (other, curr)
}
print(t1.sndCount)
