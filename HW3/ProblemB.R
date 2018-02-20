NegBinomDist <- function(nreps) {
    p <-0.4 # prob is given
    r <- 3 # number of successes
    # add r to rnbinom because rnbinom outputs number of failures
    Nvector <- rnbinom(nreps, size = r, prob = p) + r
    EN <- mean(Nvector)
    ENsquared <- mean(Nvector^2)
    varN <- ENsquared - EN^2
    stdN <- sqrt(varN)
    skewN <- mean((Nvector - EN)^3 / stdN^3)
    skewN
}

NegBinomDist(10000)
