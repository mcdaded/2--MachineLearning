library(ggplot2)
data(diamonds)
set.seed(42)
diamonds <- diamonds[sample(1:nrow(diamonds), 5000),]
head(diamonds)