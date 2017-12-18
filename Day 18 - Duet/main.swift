enum State {
	case waitingToStart
	case running
	case waitingToReceive
	case terminated
}

class Program {
	var commands = [[String]]()
	var pc = 0
	var state: State = .waitingToStart
	var regValues = [String: Int]()

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

	func snd(_ x: String) {
		fatalError("Must override `snd`.")
	}

	func rcv(_ x: String) {
		fatalError("Must override `rcv`.")
	}

	// On exit, state is either .waiting or .terminated.
	func run() {
		state = .running
		while state == .running {
			if pc < 0 || pc >= commands.count {
				state = .terminated
				return
			}

			let cmd = commands[pc]
			let instr = cmd[0]
			let x = cmd[1]
			let y = ((cmd.count == 3) ? cmd[2] : "")

			switch instr {
			case "snd": snd(x)
			case "set": regValues[x] = valueForParam(y)
			case "add": regValues[x] = valueForParam(x) + valueForParam(y)
			case "mul": regValues[x] = valueForParam(x) * valueForParam(y)
			case "mod": regValues[x] = valueForParam(x) % valueForParam(y)
			case "rcv": rcv(x)
			case "jgz":
				if valueForParam(x) > 0 {
					pc += valueForParam(y) - 1  // Subtract 1 because we'll add 1 in a moment.
				}
			default: fatalError("Unexpected instruction '\(instr)'.")
			}

			if state == .running {
				pc += 1
			}
		}
	}
}

class Program1: Program {
	var lastSnd = -999

	override func snd(_ x: String) {
		lastSnd = valueForParam(x)
	}

	override func rcv(_ x: String) {
		if valueForParam(x) != 0 {
			state = .terminated
		}
	}
}

class Program2: Program {
	var otherProgram: Program2?
	var queue = [Int]()  // append to push, removeFirst to pop
	var sndCount = 0

	override func snd(_ x: String) {
		otherProgram?.queue.append(valueForParam(x))
		sndCount += 1
	}

	override func rcv(_ x: String) {
		if queue.count == 0 {
			state = .waitingToReceive
		} else {
			regValues[x] = queue.removeFirst()
		}
	}
}

func solve1() {
	let t = Program1(programID: 0, lines: inputLines)
	t.run()
	print(t.lastSnd)
}

func solve2() {
	let t0 = Program2(programID: 0, lines: inputLines)
	let t1 = Program2(programID: 1, lines: inputLines)
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
}

solve1()
solve2()

