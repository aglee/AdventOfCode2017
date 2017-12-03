// inputLines contains the input data, an array of strings.

let digits = Array(inputLines[0]).map({ Int(String($0))! })
let numDigits = digits.count

func solve(arrayOffset: Int) {
	var total = 0
	for i in 0..<numDigits {
		if digits[i] == digits[(i + arrayOffset) % numDigits] {
			total += digits[i]
		}
	}
	print(total)
}

func solve1() {
	solve(arrayOffset: 1)
}

func solve2() {
	solve(arrayOffset: numDigits/2)
}

solve1()
solve2()
