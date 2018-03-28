# Show variables that are correlated with eachother
N <- 100
rho <- 0.7
x_pos <- rnorm(N)
x_neg <- rnorm(N, rho*x_pos, sqrt(1-rho^2))
y <- rnorm(N, x_pos - x_neg)
d <- data.frame(y, x_pos, x_neg)


# pairs(d) multicollinearity shown if x_pos and x_neg are correlated

# load data 
library(rethinking) 
data(WaffleDivorce) 
d <- WaffleDivorce

# standardize predictor 
d$MedianAgeMarriage.s <- (d$MedianAgeMarriage-mean(d$MedianAgeMarriage))/ sd(d$MedianAgeMarriage)

# fit model 
m5.1 <- map( 
  alist( 
    Divorce ~ dnorm( mu , sigma ) , 
    mu <- a + bA * MedianAgeMarriage.s , 
    a ~ dnorm( 10 , 10 ) , 
    bA ~ dnorm( 0 , 1 ) , 
    sigma ~ dunif( 0 , 10 ) 
  ) , 
  data = d )

precis(m5.1)
plot(precis(m5.1))