// inputLines contains the input data, an array of strings.

let digits = Array(inputLines[0]).map({ Int(String($0))! })
let numDigits = digits.count

func solve1() {
	var total = 0
	for i in 0..<numDigits {
		if digits[i] == digits[(i+1) % numDigits] {
			total += digits[i]
		}
	}
	print(total)
}

func solve2() {
	var total = 0
	for i in 0..<numDigits {
		if digits[i] == digits[(i + (numDigits/2)) % numDigits] {
			total += digits[i]
		}
	}
	print(total)
}

solve1()
solve2()
