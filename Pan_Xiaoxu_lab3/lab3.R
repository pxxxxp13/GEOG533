install.packages('dplyr')
library(dplyr)
library(MASS)
df <- Cars93
head(df)

df.training <- sample_n(df,40)                                          ##select 40 cars for training dataset
df.test <- setdiff(df,df.training)                                      ##remaining 53 cars as the test dataset
write.csv(df.training,"carstraining")                                   ##save datasets as csv files
write.csv(df.test,"carstest")
nrow(df.training[df.training$Origin == "USA",])                         ##find out the number of usa and non-usa cars
nrow(df.training[df.training$Origin == "non-USA",])

Birth1 <- sample(c('boy','girl'),10,replace = TRUE,prob = c(0.515,0.485))
print(Birth1)
table(Birth1)
Birth2 <- sample(c('boy','girl'),10000,replace = TRUE,prob = c(0.515,0.485))
print(Birth2)
table(Birth2)

dbinom(3,size = 10,prob = 0.515)
dbinom(8,size = 10,prob = 0.515)+pbinom(8,size = 10,prob = 0.515,lower.tail = FALSE)
x <- 0:10                                                                ##plot the function
y <- dbinom(x,size = 10,prob = 0.515)
yy <- pbinom(x,size = 10,prob = 0.515)
plot(x,y,type = "l",main = 'density',xlab = 'number of boys',ylab = 'possibility')
plot(x,yy,type = "l",main = 'cumulative',xlab = 'number of boys',ylab = 'possibility')

dpois(4,lambda = 5)
ppois(5,lambda = 5,lower.tail = FALSE)
p <- 0:20                                                                 ##plot the function
q <- dpois(p,lambda = 5)
plot(p,q,type = 'l',main = 'density',xlab = 'number of cars',ylab = 'possibility')
