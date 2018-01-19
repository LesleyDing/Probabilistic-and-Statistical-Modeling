# ECS-132 Homework I

Due Monday, January 22

## Notes on Submission Packages

*   In any Homework assignment, include all the files for problems due on the same date in the same **.tar** file, NO SUBDIRECTORIES. When the TA's grading script unpacks the file, all the files should be in the directory from which she issued the unpack command. The name of the **.tar** file must be as specified in the course Syllabus.

*   Submit your **.tex** and **.pdf** files, and any image files that a problem might require.

*   Your **.tex** file name should be **Hwkx.tex**, where 'x' is the homework number, e.g. **HwkI.tex** here.

*   Be sure to use exactly the same function names, file names etc. as in the specs!

Here and in future assignments, unless otherwise stated, when asked to find a probability, do so both both analytically (i.e. math) and via R simulation code. In the latter case, again unless directed otherwise, the TA's grading script should be able to run, say for Problem A,

<pre>Rscript ProblemA.R
</pre>

and have the simulation output come out automatically.

**NOTE CAREFULLY:** In Homework I, you are required to show your steps in order to get credit. In particular, you must cite the "mailing tubes." You really should do this on all assignments, but you may wish to skip some details later.

## Problem A

Say cars crossing a certain multilane bridge take either 3, 4 or 5 minutes for the trip. 50% take 3 minutes, with a 25% figure each for the 4- and 5-minute trips. We will consider the traversal by three cars, named A, B and C, that simultaneously start crossing the bridge. They are in different lanes, and operate independently. Place your code in a file **ProblemA.R**, as a 3-line file, one number per line and no nonnumeric material.

*   Find the probability that the first arrival to the destination is at the 4-minute mark.

*   Find the probability that the total trip time for the three cars is 10 minutes.

*   An observer reports that the three cars arrived at the same time. Find the probability that the cars each took 3 minutes to make the trip.

## Problem B:

Consider the simple ALOHA network model in our book, run for two epochs with X<sub>0</sub> = 2\. Say we know that there was a total of two transmission attempts. Find the probability that at least one of those attempts occurred during epoch 2\. (Note: In the term _attempt_, we aren't distinguishing between successful and failed ones.) Give your analytical answer for general p and q, but evaluate it for p = 0.6 and q = 0.2. Place your code in a file **ProblemB.R**

## Problem C:

Consider the Preferential Attachment Model, Sec. 2.13.1 of our book. In this problem, you will write code to simulate the model. The call form will be

<pre>PAMsim(nNodes)
</pre>

where **nNodes** is the number of nodes to be simulated, including the two original ones. The return value is the vector of degrees of all the nodes, at the time just after the addition of the last one.

By calling this function many times, one can find (approximate) probabilities involving the model. To test your code, use it to verify (2.74).

Note: In testing your code, the TA will run it to simulate a more complex probability, say the probability that after time 8, there are two nodes having degree 1.
