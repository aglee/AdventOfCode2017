#!/usr/bin/python

inputNum = 289326

def nextXY(x, y):
    """
    Returns the coordinates of the next cell in the spiral.  The point (x, y)
    is considered to be on the perimeter of a square centered at (0, 0).
    """
    
    # Special case: the origin.
    if (x, y) == (0, 0):
        return (1, 0)

    # Special case: a corner.
    if abs(x) == abs(y):
        if y > 0:
            # Top right and top left corners.
            return (x - 1, y) if x > 0 else (x, y - 1)
        else:
            # Bottom two corners.
            return (x + 1, y)

    # Remaining cases.  Ironically, they are "edge" (of the square)
    # cases but not edge cases. :)
    if x > 0 and abs(y) < x:
        return (x, y + 1)  # Right edge (excluding corners).
    if y > 0 and abs(x) < y:
        return (x - 1, y)  # Top edge (excluding corners).
    if x < 0 and abs(y) < abs(x):
        return (x, y - 1)  # Left edge (excluding corners).
    if y < 0 and abs(x) < abs(y):
        return (x + 1, y)  # Bottom edge (excluding corners).

def solve1():
    (x, y) = (0, 0)
    value = 1
    while True:
        (x, y) = nextXY(x, y)
        value += 1
        if value == inputNum:
            print(abs(x) + abs(y))
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

