boardsim <- function (nrolls) {
  position <- 0 # start at 0
  nwins <- 0 # number of wins
  vwins <- 0 # value of total winnings
  
  # to count ET_j
  starts <- rep(0,8)
  TotalRollsNeeded <- rep(0,8)
  prevpositions <- rep(0,8)

  # start
  for (i in 1:nrolls) {
    # roll the dice
    position <- position + sample(1:6,1)
    # if win
    if (position > 7) {
      nwins <- nwins + 1
      position <- position - 8
      vwins <- vwins + position
      # add the rolls counted form all previous positions
      for (j in 1:length(prevpositions)) {
        TotalRollsNeeded[j] <- TotalRollsNeeded[j] + prevpositions[j]
      }
      prevpositions <- rep(0,8) # initialize the vector
      # save the current position as a unwon previous position
      prevpositions[position + 1] <- 1 
    }
    # if not win
    else {
      # all previous position add 1 needed roll      
      for (j in 1:length(prevpositions)) {
        if(prevpositions[j] >= 1) {
          prevpositions[j] <- prevpositions[j] + 1
        }
      }
      prevpositions[position + 1] <- 1 
    }
    # increment current position count by 1
    starts[position + 1] <- starts[position + 1] + 1
  }
  ETs <- TotalRollsNeeded / starts
  names(ETs) <- c('ET0', 'ET1', 'ET2', 'ET3', 'ET4', 'ET5', 'ET6', 'ET7')
  cat("The long-run average number of rolls between wins: ", nrolls / nwins, "\n")
  cat("The long-run value of total winnings per turn: ", vwins / nrolls, "\n")
  cat("ETj:\n")
  ETs
}

print(boardsim(1000000))
