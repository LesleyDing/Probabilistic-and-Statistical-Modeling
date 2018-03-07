# function specifictions ucd family
ducd <- function(x,c) ifelse(x<=1 || c <= x, 0, (3/(2*(c^1.5-1))) * x^(1/2))
pucd <- function(q,c) integrate(function(t)(3/(2*(c^1.5-1))) * t^(1/2),1,q)$value
qucd <- function(q,c) ((q+(1/(c^1.5-1)))*(c^(3/2)-1))^(2/3)
rucd <- function(n,c) qucd(runif(n),c)

# function checkings
paste("For c = 5, the mean of X should be about 3.23: ", mean(rucd(10000000, 5)))
