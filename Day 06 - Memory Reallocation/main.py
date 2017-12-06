#!/usr/bin/python

import operator

banks = [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6]
#banks = [0, 2, 7, 0]
seen = set()
seen.add(tuple(banks))


def distrib():
    index, numBlocks = max(enumerate(banks), key=operator.itemgetter(1))
    banks[index] = 0
    for i in range(numBlocks):
        banks[(index + i + 1) % len(banks)] += 1

def solve1():
    steps = 0
    while True:
        steps += 1
        distrib()
        if tuple(banks) in seen:
            print(steps)
            return
        else:
            seen.add(tuple(banks))

solve1()
seen = set()
seen.add(tuple(banks))
solve1()
