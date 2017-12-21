# Direct translation of my Swift solution for Advent of Code Day 21.
# This runs in 4-5 seconds.  The Swift version takes 14-15 seconds.
# It's possible the Python version could be sped up further by using
# string lists rather than strings in the rules dictionary.  This
# would eliminate a lot of calls to `split` and `join`.  And maybe
# using a matrix library would speed it up even further.  I just
# wanted a rough comparison of how the approach I chose would perform
# in the two languages.

from functools import reduce
import operator
import os,sys,inspect

def get_input_lines(file_name):
    file_dir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
    file_path = os.path.join(file_dir, file_name)
    return [line.rstrip('\n') for line in open(file_path)]

def fatalError(s = "Unknown error."):
    print('[ERROR] ' + str(s))
    exit()

# We use strings to represent grids of "pixels".
def rowStrings(s): return s.split("/")

def numOn(s): return s.count("#")
    
def rotatedRight(s):
    rows = list(map(list, rowStrings(s)))  # Python 3 returns iterator, not list.
    if len(rows) == 2:
        return (rows[1][0] + rows[0][0]
                + "/" + rows[1][1] + rows[0][1])
    elif len(rows) == 3:
        return (rows[2][0] + rows[1][0] + rows[0][0]
                + "/" + rows[2][1] + rows[1][1] + rows[0][1]
                + "/" + rows[2][2] + rows[1][2] + rows[0][2])
    else: fatalError("rotatedRight -- Unexpected row count.")

def flippedHorizontal(s):
    rows = list(map(list, rowStrings(s)))  # Python 3 returns iterator, not list.
    if len(rows) == 2:
        return (rows[0][1] + rows[0][0]
                + "/" + rows[1][1] + rows[1][0])
    elif len(rows) == 3:
        return (rows[0][2] + rows[0][1] + rows[0][0]
                + "/" + rows[1][2] + rows[1][1] + rows[1][0]
                + "/" + rows[2][2] + rows[2][1] + rows[2][0])
    else: fatalError("flippedHorizontal -- Unexpected row count.")
    
def flippedVertical(s):
    rows = list(map(list, rowStrings(s)))  # Python 3 returns iterator, not list.
    if len(rows) == 2:
        return (rows[1][0] + rows[1][1]
                + "/" + rows[0][0] + rows[0][1])
    elif len(rows) == 3:
        return (rows[2][0] + rows[2][1] + rows[2][2]
                + "/" + rows[1][0] + rows[1][1] + rows[1][2]
                + "/" + rows[0][0] + rows[0][1] + rows[0][2])
    else: fatalError("flippedVertical -- Unexpected row count.")
    
def printAsGrid(s):
    for row in rowStrings(s): print(row)

rules = {}

def loadRules(ruleLines):
    global rules
    rules = {}
    for line in ruleLines:
        (lhs, rhs) = line.split(" => ")
        
        # Add all combinations of rotating and flipping.
        for _ in range(4):
            lhs = rotatedRight(lhs)
            rules[lhs] = rhs
            rules[flippedHorizontal(lhs)] = rhs
            rules[flippedVertical(lhs)] = rhs

class Grid:
    def __init__(self):
        self.gridRows = []

    def numPixelsOn(self):
        return reduce(operator.add, map(numOn, self.gridRows))

    # Returns a string representation of a sub-grid.  Assumes valid input that
    # won't go out of bounds.
    def getSquare(self, size, cornerRow, cornerCol):
        rows = []
        for i in range(size):
            rows.append(self.gridRows[cornerRow + i][cornerCol : (cornerCol+size)])
        return "/".join(rows)
    
    # It's expected we'll call this in a loop that fills the grid with squares
    # from top to bottom, left to right.
    def putSquare(self, s, startingRow):
        squareRows = rowStrings(s)
        
        # Add empty rows if necessary.
        if startingRow == len(self.gridRows):
            for _ in range(len(squareRows)): self.gridRows.append("")
        elif startingRow > len(self.gridRows):
            fatalError("Bad starting row.")
        
        # Append the given square rows to the indicated grid rows.
        for i in range(len(squareRows)):
            self.gridRows[startingRow + i] += squareRows[i]
    
    def enhancedGrid(self):
        newGrid = Grid()
        squareSize = 2 if (len(self.gridRows) % 2 == 0) else 3
        newSquareSize = squareSize + 1  # We're told every rule's rhs is 1 bigger than lhs.
        for row in range(0, len(self.gridRows), squareSize):
            for col in range(0, len(self.gridRows), squareSize):
                oldSquare = self.getSquare(squareSize, row, col)
                rhs = rules[oldSquare]
                if rhs is None: fatalError("No rule found.")
                newGrid.putSquare(rhs, (row // squareSize) * newSquareSize)
        return newGrid
    
    def dump(self):
        for row in self.gridRows: print(row)

def solve(iterations):
    g = Grid()
    g.putSquare(".#./..#/###", 0)
    for _ in range(iterations):
        g = g.enhancedGrid()
    print(g.numPixelsOn())

def solve1():
    loadRules(get_input_lines("input.txt"))
    solve(5)

def solve2():
    loadRules(get_input_lines("input.txt"))
    solve(18)

solve1()
solve2()

