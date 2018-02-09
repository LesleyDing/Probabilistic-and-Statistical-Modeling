# function to determine number of passengers boarding the bus at each stop
new_passengers <- function() sample(0:2, size = 1, prob = c(0.5,0.4,0.1))

busRidership <- function(nreps) {
  # building vectors for B and Bsq
  temp <- new_passengers()
  Bvector <- temp
  EBsq <- temp^2
  for (i in 2:nreps) {
    temp <- new_passengers()
    Bvector <- c(Bvector,temp)
    EBsq <- c(EBsq, temp^2)
  }
  EB <- mean(Bvector) # takes the average of each each of B
  EBsq <- mean(EBsq) # takes the average of each value of B^2
  varB <- EBsq - EB^2 
  stdBcubed <- (varB)^(3/2)
<<<<<<< HEAD
  paste("E[(X - μ)3/ σ3] =", mean((Bvector - EB)^3 / stdBcubed)) # the skewness of B
=======
  mean((Bvector - EB)^3 / stdBcubed) # the skewness of B
>>>>>>> 302206cd23f0af4376d3d15b06022341751fc069
}

busRidership(10000)
