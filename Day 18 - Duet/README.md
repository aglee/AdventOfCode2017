# Advent of Code 2017, Day 18

Whereas Day 16 had me shaking my fist a bit at Swift strings, today's puzzle felt like a good fit for Swift.  Also, this was a case where my kneejerk impulse to wrap stuff in a class was reasonable.

After solving Part 1 I mangled the code to solve Part 2.  Afterwards I went back and retrofitted the code so it solves both parts.

During the retrofitting I introduced a puzzling bug that caused an infinite loop.  I had been lucky this time to solve both Part 1 and Part 2 correctly with no bugs, so (perhaps arrogantly) I was surprised that a few simple tweaks would cause a headache.  It turned out to be caused by changing how I terminate the loop in my `run()` method.  In my original code for both Part 1 and Part 2, I had been using an early `return` to handle the `rcv` case.  In the combined Parts 1 and 2 code, I moved that logic to a separate `rcv()` method, and caused the loop to terminate by setting program state to `.waiting`.  What I didn't notice was that the early `return` had been preventing the program counter from incrementing.  My fix was to check that the program was still in the `.running` state before incrementing the PC.

Stuff seen on r/adventofcode:

- etotheipi1 figured out [what the program actually does](https://www.reddit.com/r/adventofcode/comments/7kj35s/2017_day_18_solutions/dreucbm/), by manually decompiling the assembly.  (Spoiler: the two program instances do a sort by passing values back and forth.)
- [A solution from JustHev](https://www.reddit.com/r/adventofcode/comments/7kj35s/2017_day_18_solutions/drevfcr/) using bash to have two actual program instances talk to each other.  Others used multiprocessing features of their chosen language.
- Turns out the numbers being generated required [64-bit longs](https://www.reddit.com/r/adventofcode/comments/7kj35s/2017_day_18_solutions/dreyz1x/), which was a stumbling block for some.
- A pitfall for some: not initializing the "p" registers to 0 and 1.
- Another pitfall: assuming instruction arguments would be register names in cases where they could also be numbers.

