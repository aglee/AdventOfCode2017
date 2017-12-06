#!/usr/bin/python

inputNum = 289326

def left(x, y): return (x - 1, y)
def right(x, y): return (x + 1, y)
def up(x, y): return (x, y + 1)
def down(x, y): return (x, y - 1)

def nextXY(x, y):
    """
    Returns the coordinates of the next cell in the spiral.  The point (x, y)
    is considered to be on the perimeter of a square centered at (0, 0).  We
    get to the next cell by traveling counterclockwise on that perimeter.
    """
    
    # Special case: the origin.
    if (x, y) == (0, 0): return (1, 0)

    # Special case: a corner.
    if abs(x) == abs(y):
        if y > 0:
            if x > 0: return left(x, y)  # Top right.
            else: return down(x, y)  # Top left.
        else: return right(x, y)  # Bottom two corners.

    # Remaining cases.  Ironically, they are "edge" (of the square)
    # cases but not edge cases. :)
    if x > 0 and abs(y) < x: return up(x, y)  # Right edge.
    if y > 0 and abs(x) < y: return left(x, y)  # Top edge.
    if x < 0 and abs(y) < abs(x): return down(x, y)  # Left edge.
    if y < 0 and abs(x) < abs(y): return right(x, y)  # Bottom edge.

def solve1():
    (x, y) = (0, 0)
    value = 1
    while True:
        (x, y) = nextXY(x, y)
        value += 1
        if value == inputNum:
            print(abs(x) + abs(y))  # Manhattan distance.
            return

def solve2():
    grid = {}  # Maps (x, y) tuple to integer cell value.
    
    def cellValue(x, y):
        total = 0
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                if (dx, dy) == (0, 0): continue
                neighborValue = grid.get((x + dx, y + dy))
                if neighborValue: total += neighborValue
        return total
    
    (x, y) = (0, 0)
    value = 1
    grid[(x, y)] = value
    while True:
        (x, y) = nextXY(x, y)
        value = cellValue(x, y)
        grid[(x, y)] = value
        if value > inputNum:
            print(value)
            return

solve1()
solve2()

