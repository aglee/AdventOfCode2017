// inputLines contains the input data, an array of strings.

var inputRows: [[Int]] = []

for line in inputLines {
	let row = line.split(separator: "\t").map({ Int($0)! })
	inputRows.append(row)
}

func solve1() {
	var checksum = 0
	for row in inputRows {
		var rowMax = Int.min
		var rowMin = Int.max
		for num in row {
			if num > rowMax { rowMax = num }
			if num < rowMin { rowMin = num }
		}
		checksum += rowMax - rowMin
	}
	print(checksum)
}

func solve2() {
	var checksum = 0
	for row in inputRows {
		let sortedRow = row.sorted()
		for i in 0..<sortedRow.count-1 {
			for j in i+1..<sortedRow.count {
				if sortedRow[j] % sortedRow[i] == 0 {
					checksum += sortedRow[j] / sortedRow[i]
					break
				}
			}
		}
	}
	print(checksum)
}

solve1()
solve2()
