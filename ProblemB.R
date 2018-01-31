
# PAMsim function simulate Preferential Attachment Graph model
PAMsim <- function(nreps) {
  nNodes <- 4
  EV1 <- 0
  EV2 <- 0
  V1sq <- 0
  EV1V2 <- 0
  
  # update the graph model
  for (i in 1:nreps) {
    graph <- c(1,1)
    for (j in 1:(nNodes-2)) {
      # get a random sample with calculated probability
      sample <- sample(1:length(graph), size = 1, replace = TRUE, prob = (graph/sum(graph)))
      
      # update the graph
      graph <- c(graph, 1)
      graph[sample] <- graph[sample] + 1
    }

    # calculate values for expected values
    EV1 <- EV1 + graph[1]
    EV2 <- EV2 + graph[2]
    EV1V2 <- EV1V2 + graph[1] * graph[2]
    V1sq <- V1sq + graph[1]^2
  }
  EV1 <- EV1 / nreps
  EV2 <- EV2 / nreps
  EV1V2 <- EV1V2 / nreps
  VarV1 <- V1sq / nreps - EV1^2 # variance
  CovV1V2 <- EV1V2 - EV1 * EV2
  
  cat("Expected value of the degree of v1: ", EV1, "\n")
  cat("Variance of the degree of v1: ", VarV1, "\n")
  cat("Covariance between the degrees of v1 and v2: ", CovV1V2, "\n")
}

PAMsim(1000)