simProbB <- function(nreps,lambda,alpha,beta) {
    # generate nreps of boxes with N item per box,  with N having a Poisson distribution with parameter λ
    boxes <- rpois(nreps, lambda)
    # p is the probability of that an item is defective, with p having beta distribution with parameters α and β.
    p <- rbeta(nreps, alpha, beta)
    # d = the number of defectives in a box
    d <- boxes * p
    # the mean of d
    ed <- mean(d)
    # the variance of d, using mailing tube (3.41)
    vard <- mean(d^2) - ed^2
    # a partial check that ED = λ α / (α + β)
    edcheck <- lambda * alpha / (alpha + beta)
    cat("The mean of D: ", ed, "\n")
    cat("The variance of D: ", vard, "\n")
    cat("Check that ED = λ α / (α + β): ", edcheck)
}
