// inputLines contains the input data, an array of strings.

func solve1() {
	var numValid = 0
	for line in inputLines {
		let wordList = line.split(separator: " ").map({ String($0) })
		let wordSet = Set(wordList)
		if wordList.count == wordSet.count { numValid += 1 }
	}
	print(numValid)
}

func solve2() {
	var numValid = 0
	for line in inputLines {
		let wordList = line.split(separator: " ").map({ String(String($0).sorted()) })
		let wordSet = Set(wordList)
		if wordList.count == wordSet.count { numValid += 1 }
	}
	print(numValid)
}

solve1()
solve2()

