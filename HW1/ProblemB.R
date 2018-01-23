# function to generate random probablity to send message
random_send <- function() sample(c(0,1), size = 1, replace = TRUE, prob = c(0.4, 0.6))

# function to generate random probablity to generate new message
random_generate <- function() sample(c(0,1), size = 1, replace = TRUE, prob = c(0.8, 0.2))

ALOHAnetwork <- function() {
  sample_size = 50000
  count <- 0
  for (i in 1:sample_size){
    # node a and node b both active at epoch 0
    a <- TRUE
    b <- TRUE
    transmission_attempts <- 0
    # epoch 1 period, testing if nodes a and b will send a message or not
    if(random_send()){
      a <- FALSE
      transmission_attempts <- transmission_attempts + 1
    }
    if(random_send()){
      b <- FALSE
      transmission_attempts <- transmission_attempts + 1
    }
    # If both nodes a and b tried to send a message, then that means two transmission attempts happened
    # during epoch 1, resulting in a failure for this experiment (or a NO in a line of our notebook)
    # which means we can move on to the next repetition for this simulation.
    
    # epoch 2 period, given that at most 1 transmission attempt was made
    if (transmission_attempts != 2){
      # attempt to generate a message for whichever node was set inactive from epoch 1
      if(!a & random_generate()) a <- TRUE
      if(!b & random_generate()) b <- TRUE
      # both nodes attempt to send a message again
      if(a & random_send()){
        a <- FALSE
        transmission_attempts <- transmission_attempts + 1
      }
      if(b & random_send()){
        b <- FALSE
        transmission_attempts <- transmission_attempts + 1
      }
      # since epoch 2 is only reachable in the code if at most 1 transmission attempt was made during
      # epoch 1, then the experiment is a success (or a YES in a line of our notebook) as long as 
      # exactly 2 transmission attempts were made in total.
      if (transmission_attempts == 2) count <- count + 1
    }
  }
  print(count/sample_size)
}
ALOHAnetwork()