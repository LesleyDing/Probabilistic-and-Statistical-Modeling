# function to generate random samples with given probability
random_sample <- function() sample(3:5, size = 3, replace = TRUE, prob = c(0.5, 0.25, 0.25))

# function to generate random sample with given sample size
sums_generator <- function(sample_size) replicate(sample_size, sum(random_sample()))

# A1: Find the probability that the first arrival to the destination is at the 4-minute mark.
prob_A1 <- function(sample_size) {
  count <- 0
  for (i in 1:sample_size) {
    sample <- random_sample()
    count <- count + (sum(sample==3)==0 & sum(sample==5)<3)
  }
  count/sample_size
}

# A2: Find the probability that the total trip time for the three cars is 10 minutes.
prob_A2 <- function(sample_size) mean(sums_generator(sample_size)==10)

# A3: Find the probability that the cars each took 3 minutes to make the trip
prob_A3 <- function(sample_size) mean(sums_generator(sample_size)==9)

# run simulations
paste("P(X0 = 4) =", prob_A1(100000))
paste("P(TA + TB + TC = 10) =", prob_A2(100000))
paste("P(TA = 3, TB = 3, TC = 3) =", prob_A3(100000))