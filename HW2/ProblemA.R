random_dice <- function() sample(1:6, size = 2, replace = TRUE)

count_even <- function(dice) sum(dice %% 2 == 0)

dice <- function() {
  nreps = 500000
  s <- 0
  t <- 0
  st <- 0
  for (i in 1:nreps){
    dice <- random_dice()
    s <- s + sum(dice)
    t <- t + count_even(dice)
    st <- st + sum(dice)*count_even(dice)
  }
  c(s/nreps, t/nreps, st/nreps)
}

dice()