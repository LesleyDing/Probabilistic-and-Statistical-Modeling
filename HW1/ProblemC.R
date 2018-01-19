# function simulate preferential attachment graph model
# return a vector of degrees of all the nodes, at the time after the addition of new node
PAMsim <- function(nNodes) {
  # create the original graph model
  graph <- rbind(c(0,1), c(1,0))

  # update the graph model
  if (nNodes > 2) {
    for (i in 1:(nNodes-2)) {
      # get a random sample with calculated probability
      sample <- sample(1:nrow(graph), size = 1, replace = TRUE, prob = (rowSums(graph)/sum(graph)))

      # update the graph
      new_column <- replicate(nrow(graph), 0)
      new_column[sample] = 1
      new_row <- c(new_column, 0)
      graph <- cbind(graph, new_column)
      graph <- rbind(graph, new_row)
      graph <- unname(graph)
    }
  }
  rowSums(graph)
}

# simulation example for N4
PAMsim(4)