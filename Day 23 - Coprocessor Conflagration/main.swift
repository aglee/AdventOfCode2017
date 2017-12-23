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
	
	var mulCount = 0
	var numCommandsExecuted = 0
	var hValue = 0
	
	let isPart2: Bool
	
	init(lines: [String], isPart2: Bool) {
		self.isPart2 = isPart2
		
		if isPart2 {
			regValues["a"] = 1
		}
		
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
			case "set":
				regValues[x] = valueForParam(y)
				if isPart2 {
					if x == "h" { print("h = \(valueForParam(y))") }
				}
			case "sub": regValues[x] = valueForParam(x) - valueForParam(y)
			case "mul":
				regValues[x] = valueForParam(x) * valueForParam(y)
				mulCount += 1
			case "jnz":
				if valueForParam(x) != 0 {
					pc += valueForParam(y) - 1  // Subtract 1 because we'll add 1 in a moment.
				}
			default: fatalError("Unexpected instruction '\(instr)'.")
			}
			
			numCommandsExecuted += 1
			if isPart2 {
//				if numCommandsExecuted % 1_000_000 == 0 {
//					var s = ""
//					for reg in ["a", "b", "c", "d", "e", "f", "g", "h"] {
//						s += "\(valueForReg(reg))"
//						s += "\t"
//					}
//					print(s)
//				}
				if x == "h" && valueForParam("h") != hValue {
					hValue = valueForParam("h")
					print("new h value: \(hValue)")
				}
			}
			
			if state == .running {
				pc += 1
			}
		}
	}
}

func solve1() {
	let p = Program(lines: inputLines, isPart2: false)
	p.run()
	print(p.mulCount)
}

func solve2() {
	func isPrime(_ n: Int) -> Bool {
		for k in 2...n {
			if n % k == 0 { return false }
			if k*k > n { break }
		}
		return true
	}
	
	var h = 0
	for b in stride(from: 107900, through: 124900, by: 17) {
		if !isPrime(b) {
			h = h + 1
		}
	}
	print(h)
}

solve1()
solve2()

