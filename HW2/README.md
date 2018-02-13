# Homework II

Due Monday, February 5


## Notes on Submission Packages
Tar all files in workng directory:
<pre>tar -cvf njahja.kblu.lhding.aaama.tar *</pre>
Submission command:
<pre>handin cs132 hw2 njahja.kblu.lhding.aaama.tar</pre>

## Problem A:

An example was brought up in class, in connection with the discussion of Property D:

Roll 2 dice, yielding X and Y. Define S as the total, X+Y, and let T be the number of dice (0, 1 or 2) that show an even number of dots. E.g. if X = 4 and Y = 3, then T = 1\.

Show, by example of a specific probability of the form P (S = j | T = i) that S and T are not independent. (You should be able to do this without formal calculation.)

By calculating actual expected values, determine how close (3.25) is to being correct in this case. (Math only, no simulation.)

## Problem B:

Consider the Preferential Attachment Model, at the time immediately after v<sub>4</sub> is added. Find the following, both mathematically and by simulation:

*   Expected value and variance of the degree of v<sub>1</sub>.

*   Covariance between the degrees of v<sub>1</sub> and v<sub>2</sub>.

Place your code in a file **ProblemB.R**.

## Problem C:

The _skewness_ (i.e. amount of asymmetry) of a random variable X is defined to be E[(X - μ)<sup>3</sup>/ σ<sup>3</sup>]. Find this for the random variable B in the bus ridership problem, both mathematically and via simulation. Place your code in a file **ProblemC.R**.

## Problem D:

Consider the board game example, with the random variable B being the amount of bonus, 0,1,...,6\. Find EB and Var(B), both mathematically and via simulation. Note that in the latter case you need not simulate the entire game, just the generation of the bonus. Place your code in a file **ProblemD.R**.
