Homework III
============

Due Tuesday, February 20

## Notes on Submission Packages
Tar all files in workng directory:
<pre>tar -cvf njahja.kblu.lhding.aaama.tar *</pre>
Submission command:
<pre>handin cs132 hw3 njahja.kblu.lhding.aaama.tar</pre>

Recall the rule that in any problem in which you calculate a probability you must solve it both mathematically and by simulation. That holds for expected values as well.

Problem A:
----------

(No simulation required in this problem.)

R offers four different types of classes. Here you will learn about S3, the earliest and most popular class. You will also learn about R _attributes_, kind of a substitute for full class structure.

Normally (see the [early draft of my R book](http://heather.cs.ucdavis.edu/~matloff/132/NSPpart.pdf)) one creates an S3 class by forming an R list consisting of the intended member variables, then declares it to be of the specified class. E.g.

\> l <- list(a = 5, b = 12, c = 13)
\> class(l) <- 'rtTriangle'
\> l
$a
\[1\] 5

$b
\[1\] 12

$c
\[1\] 13

attr(,"class")
\[1\] "rtTriangle"

However, in our case here our class will consist of a vector rather than a list, in order to be able to still treat it as a vector. We will still bestow a class name to it, but instead of member variables we will have attributes. Here are the details:

*   Each object of the class will represent a discrete distribution. Your class will thus be named **'pmf'**. (Class names must be quoted.)
    
*   The mean and variance of the class instance will be stored in R attributes of those names, 'meanx' and 'variancex'.
    
    Here is an example of attributes:
    
    \> u <- c(5,12,13,8)
    \> attr(u,'numberOfOdds') <- 2
    \> attr(u,'numberOfOdds') 
    \[1\] 2
    \> str(u)
     atomic \[1:4\] 5 12 13 8
     \- attr(*, "numberOfOdds")= num 2
    

*   You will overload R's + operator for this class, motivated by the following. Suppose X and Y are independent random variables, and let S be their sum. S is a new random variable, so it has a distribution too. So we will define the "sum" of the **'pmf'** objects for X and Y to be the **'pmf'** object for S.
    
    Here is a toy example of operator overloading for a class **'z'**, where "sum" will mean concatenating the first element of the second operand with the rest of the first:
    
    \> '+.z' <- function(d1,d2)  # overloading '+' for class 'z'
    > {
    \>    d <- d1
    \+    d\[1\] <- d2\[1\]
    \+    class(d) <- 'z'
    \+    d
    > }
    > 
    \> x <- 1:3
    \> y <- c(5,12,13,8)
    \> class(x) <- 'z'
    \> class(y) <- 'z'
    \> z <- x + y
    \> z
    \[1\] 5 2 3
    attr(,"class")
    \[1\] "z"
    
    Implementing + will be the only challenging part of this problem.
    

*   You will have a constructor function **makePmf(supp,probs)**, which creates an instance of class **'pmf'**. Here **supp** is the support of the pmf, and **probs** are the corresponding probabilities.
    
    For example, suppose some random variable takes on the values 1, 3 and 8, with probabilities 0.5, 0.2 and 0.3. Then the call
    
    makePmf(c(1,3,8),c(0.5,0.2,0.3))
    
    will produce an object of class **'pmf'**, consisting of the vector (0.5,0.2,0.3) but with element names '1','3' and '8'.
    
    Named elements (vector element names, matrix row names etc.) are another nice feature of R. Here is an example of setting names of vector elements in R:
    
    \> z <- c(4,8,24)
    \> names(z) <- c('a','b','c')
    \> z
     a  b  c 
     4  8 24 
    
    Your constructor function with store the support of the pmf as names of the probabilities vector. Use **as.character()** to convert from numbers to strings. (You can convert back via **as.numeric()**.) As noted above, in our **makePmf()** example above, the class object will consist of a vector (0.5,0.2,0.3) whose element names are '1', '3' and '8'. Using this approach, we can store the support information into our class object without resorting to forming a list; the object consists only of a vector.
    
*   Your constructor will also set the mean and variance attributes.

*   Have the constructor declare an error if the elements of **probs** are not nonnegative numbers summing to 1, or if the length of **supp** is not the same as that of **probs**. Use the **stop()** function for this.

**WARNING:** Make absolutely sure that you think about the motivation in the problem before starting on it. Without that understanding, it will be impossible to solve this problem.

Your code, which you will submit in a file **ProblemA.R**, will consist only of **makePmf()** and **'+.pmf()**. The TA will call your functions in her test code.

Here is some other test code for you:

\> pmf1 <- makePmf(1:3,c(0.25,0.25,0.50)) 
\> pmf1 
   1    2    3 
0.25 0.25 0.50 
attr(,"meanx")
     \[,1\]
\[1,\] 2.25
attr(,"variancex")
       \[,1\]
\[1,\] 0.6875
attr(,"class")
\[1\] "pmf"
\> pmf2 <- makePmf(c(2,4),c(0.6,0.4)) 
\> pmf3 <- pmf1 + pmf2
\> pmf3
   3    5    4    6    7 
0.15 0.40 0.15 0.10 0.20 
attr(,"meanx")
     \[,1\]
\[1,\] 5.05
attr(,"variancex")
       \[,1\]
\[1,\] 1.6475
attr(,"class")
\[1\] "pmf"

Problem B:
----------

Consider a negative binomial distribution with r = 3 and p = 0.4. Find the skewness of this distribution.

Problem C:
----------

Consider our simple board game example, first introduced in Sec. 2.11, but _without_ bonus rolls. Let Xi be the square you land on after your ith turn. together count as one turn.) These random variables satisfy the Markov property. You will each time you reach or pass 0, with the amount of your winnings being i+1 dollars if your win involves landing on square i. Find the following:

*   The long-run average number of rolls (not turns) between wins.

*   The long-run value of total winnings per turn.

*   ETj, where Tj is the number of rolls needed to win if one starts at square j.

Problem D:
----------

On p.72, we use properties of infinite series to derive the fact that the mean of a geometric random variable with success probability p is 1/p. But one can derive this quickly and simply, without using properties of series, using (4.68) instead.

Take V to be the geometric random variable, and let U be the indicator variable for the event V = 1. Use the "memoryless" property here; if we don't get a success on the first trial, the mean remaining time is the same as if we are starting fresh.
