# Homework IV

Due Monday, March 5

## Notes on Submission Packages
Tar all files in workng directory:
<pre>tar -cvf njahja.kblu.lhding.aaama.tar *</pre>
Submission command:
<pre>handin cs132 hw4 njahja.kblu.lhding.aaama.tar</pre>

## Problem A

Consider the family of densities ( 3/(2*(c^1.5-1)) ) t^0.5, for 1 < t < c, 0 elsewhere. This is a one-parameter family, indexed by c > 1\. Let's call this the **ucd** family. Develop functions with the following call forms:

<pre>ducd(x,c)  # density at the values in x
pucd(q,c)  # cdf at the values in q
qucd(q,c)  # quantiles at the values of q
rucd(n,c)  # generate n random variates
</pre>

Check value: For c = 5, the mean of X should be about 3.23.

Place these in a file **ProblemA.R**. Write your reasoning in your **.tex** file for this assignment.

## Problem B

Say a certain kind of electronic component comes in N items per box, where N varies from box to box, with N having a Poisson distribution with parameter λ. Let p denote the probability that an item is defective; it too varies from box to box, though independently of N. Suppose the distribution of p is beta with parameters α and β.

Problem: Find the mean and variance of D, the number of defectives in a box.

Write simulation code to find the mean and variance. The call form should be

<pre>simProbB(nreps,lambda,alpha,beta)
</pre>

Place your code in a file **ProblemB.R**.

## Extra Credit Problem

Solve Problem B analytically, i.e. with a math derivation.

Approach: Use Equation (***) below, with V = D and U = (N,p). (U is a 2-element vector.) Given N and p, D has a binomial distribution with N trials and success probability p.

Note that (4.68) and (7.78) can be written in a unified manner as

EV = E[g(U)]

where g(t) = E(V | U = t). (You should review (3.36) and (7.28) before pondering the above unified statement of iterated expectation.)

There is a corresponding relation for variance:

Var(V) = E[v(U)] + Var[e(U)] (***)

where v(t) = Var(V | U = t) and e(t) = E(V | U = t).