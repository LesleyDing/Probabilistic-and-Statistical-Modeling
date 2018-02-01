boardsim <- function(nreps) {
  EB <- 0
  Bsq <- 0
  position <- 0
  for (i in 1:nreps) {
    position <- sample(1:6,1)
    bonus <- 0
    if (position == 3) {
      bonus <- sample(1:6,1)
      position <- (position + bonus) %% 8
    }
    EB <- EB + bonus
    Bsq <- Bsq + bonus^2
  }
  EB <- EB / nreps
  varB <- Bsq / nreps - EB^2
  c(EB, varB)
}

boardsim(100000)