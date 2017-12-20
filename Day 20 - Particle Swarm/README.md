# Advent of Code 2017, Day 20

Here's what worked for me.

I scratched my head for a while over Part 1, feeling overwhelmed by the image of hundreds of particles whizzing by in all directions.  I started reasoning (not quite correctly) like this.  After some number of ticks -- probably not a huge number, based on a glance at the data -- all particles will be moving away from the origin.  At that point I can find the one with the slowest acceleration, as measured by Manhattan distance.  No matter how far it is from the origin now, all the other particles will out-distance it in the long term.

When I was mostly done implementing that idea, I realized that the values for acceleration never change.  Accordingly, I changed that property on `Particle` from a `var` to a `let` -- and only then did it occur to me: why not just find the smallest acceleration in the first place, and skip the ticking altogether?  I did that, submitted my answer, and it was wrong.

What I'd missed was that multiple particles could have the same magnitude of acceleration, and I needed to pick from among them.  So I finally got the right answer to Part 1 as follows:

- Run the simulation until all particles are moving away from the origin.
	- In theory some particles might never move at all, but I highly doubt anyone's data set included a particle with both zero velocity and zero acceleration.  Anyway, I went back afterwards and tweaked the code to handle this case.
- Find the particle with the smallest acceleration among all the particles, as measured by Manhattan distance.
- If more than one particle has that magnitude of acceleration, pick the one that is nearest the origin.
	- We know there is only one right answer, so if multiple particles share that smallest acceleration, we can assume exactly one is nearest to the origin.

Even though this gave me the right answer, I realized in the morning that it still was not correct!  What I should have done was compare particles by acceleration, then **velocity**, and only then position.  Consider two points with the same acceleration.  One might currently be closer to the origin, but if their velocities are different, the other might overtake it on the very next tick.  I went back and fixed this in my code.

Once I had Part 1, Part 2 wasn't too bad.  My code wasn't pretty but got the job done.  In theory my reasoning for Part 2 had a loophole, but in practice it gave me the right answer.  I added a comment about this in the `solve2()` function.

Notes on what my brain was doing:

- I started with `Point` being typealiased to a tuple, then caved to my compulsion to make it a class.  Not even a struct, because I vaguely thought a reference type would be more convenient in this case.  It would have been just fine as a tuple, with top-level functions instead of methods.
- I kept wanting to find the particle that would be **farthest** from the origin in the long term instead of nearest.  I submitted another wrong answer because of this.
- I see that other people ran the simulation until they seemed to get a stable answer, or simply what they guessed was a sufficient number of iterations.  This approach worked for them.  It crossed my mind, but for some reason I was reluctant to try it, or at least to try it first.  I was writing the particle simulation anyway.  How hard could it be to let it run for a while and see what happens?

