# constructor function to create pmf object
makePmf <- function(supp,probs) {
  names(probs) <- c(supp)
  mean <- sum(supp * probs)
  attr(probs,'meanx') <- mean
  attr(probs,'variancex') <- sum((supp - mean) ^ 2 * probs)
  class(probs) <- 'pmf'
  probs
}

# TESTING
makePmf(1:3,c(0.25,0.25,0.50))

# overload + function for pmf class
'+.pmf' <- function(x, y) {
  # obtain names from x and y
  xSupp <- as.numeric(names(x))
  ySupp <- as.numeric(names(y))

  # obtain support from x and y
  xSupport <- as.numeric(names(x))
  ySupport <- as.numeric(names(y))

  # create a new vector using values from x and y
  newSupport <- vector(mode="numeric", length=0)
  newProbs <- vector(mode="numeric", length=0)
  for (i in 1:length(xSupport)) {
    for (j in 1:length(ySupport)) {
      # store temporary support and probability
      tempSupport <- xSupport[i] + ySupport[j]
      tempProb <- x[i] * y[j]

      # if support is already exist, just add the probability
      if (tempSupport %in% newSupport) {
        matchIndex <- match(tempSupport, newSupport)
        newProbs[matchIndex] <- newProbs[matchIndex] + tempProb
      }
      # else store the new suppor and new probability
      else {
        newSupport <- c(newSupport, tempSupport)
        newProbs <- c(newProbs, tempProb)
      }
    }
  }
  # using makePmf to construct new object
  makePmf(newSupport, newProbs)
}

# TESTING
x <- makePmf(1:3,c(0.25,0.25,0.50))
y <- makePmf(c(2,4),c(0.6,0.4)) 
s <- x + y
s
