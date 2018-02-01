# function to find E[(X - μ)3/ σ3]
bus_ridership <- function(nreps, nstops) {
  EB <- 0
  VarB <- 0
  for (i in 1:nreps) {
    passengers <- 0
    for (j in 1:nstops) {
      if (passengers > 0) {
        for (k in 1:passengers) {
          if (runif(1) < 0.2) {
            passengers <- passengers - 1
          }
        }
      }
      newpass <- sample(0:2, 1, prob=c(0.5,0.4,0.1))
      passengers <- passengers + newpass
    }
  }
}


bus_ridership(500000, 100)