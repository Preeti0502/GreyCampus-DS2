##################################################
########### Permutation and combination ##########
##################################################

#### Permutation
## Permutations with repetition

#install if necessary
install.packages('gtools')
#load library
library(gtools)

# Suitcase with three codes  
Suitcase <- c('A', 'B', 'C')
# pick 3 codes with replacement

#get all permutations
permutations(n=3,r=3,v=Suitcase,repeats.allowed=T)

#number of permutations
nrow(permutations(n=3,r=3,v=Suitcase,repeats.allowed=T))

## Permutations without repetition
# Suitcase with three codes  
Suitcase <- c('A', 'B', 'C')
#pick 2 balls from the urn with replacement
#get all permutations
permutations(n=3,r=3,v=Suitcase)

#number of permutations
nrow(permutations(n=3,r=3,v=Suitcase))

#### Combination
## Combinations without repetition
# You have 6 different fruits. 
# How many combinations are there for a set of 4 Fruits?
## Combinations without repetition
combinations(6, 4)

#number of combinations
nrow(combinations(n=6,r=4))

## Combinations with repetition
combinations(6, 4, repeats = TRUE)

#number of combinations
nrow(combinations(n=6,r=4, repeats = TRUE))

##################################################
#################   Sample Space #################
##################################################
Toss <-c("H", "T")
Toss
paste(sample(Toss, 2), collapse="")
permutations(n=2, r=2, v = Toss, repeats.allowed = TRUE)

##################################################
############## Union and Intersection ############
##################################################
(x <- c(sort(sample(1:20, 9)), NA))
(y <- c(sort(sample(3:23, 7)), NA))
union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)

##################################################
############# Conditional Probability ############
##################################################
working_class <- c(0, 8, 32, 8, 0)
upper_middle_class <- c(0, 0, 13, 37, 0)

## Marginal probability 
#What is the probability that a student's objective social class position is upper middle class?
sum(upper_middle_class)/(sum(working_class)+sum(upper_middle_class))


## Joint probability
# What is the probability that a student's objective position and subjective identity are both upper middle class?
A <- upper_middle_class[4]
A/(sum(working_class)+sum(upper_middle_class))

## Conditional probability
# What is the probability that a student who is objectively in the working class   associates with upper middle class?
# P(subj UMC | obj WC) = P(subj UMC and obj WC)/P(Obj WC)


Prob_sub_UMC_and_obj_WC <- 8
P_Obj_WC <- 48
Prob_sub_UMC_and_obj_WC/P_Obj_WC

##################################################
############### Normal Distribution ##############
##################################################
# R has four in built functions to generate normal distribution. 
dnorm(x, mean, sd)
# dnorm() function in R programming measures density function of distribution.
pnorm(x, mean, sd)
# pnorm() function is the cumulative distribution function which measures the 
# probability that a random number X takes a value less than or equal to x
qnorm(p, mean, sd)
# qnorm() function is the inverse of pnorm() function. It takes the probability
# value and gives output which corresponds to the probability value. It is 
# useful in finding the percentiles of a normal distribution.
rnorm(n, mean, sd)
# rnorm() function in R programming is used to generate a vector of random 
# numbers which are normally distributed.

# x is a vector of numbers.
# p is a vector of probabilities.
# n is number of observations(sample size).
# mean is the mean value of the sample data. It's default value is zero.
# sd is the standard deviation. It's default value is 1.


# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)
# Choose the mean as 2.5 and standard deviation as 0.5.
### dnorm
y <- dnorm(x, mean = 2.5, sd = 0.5)
plot(x,y)


## pnorm
plot(pnorm(x, mean = 2.5, sd = 0.5))


## qnorm
x <- seq(0, 1, by = 0.02)
y <- qnorm(x, mean = 2, sd = 1) #DataFlair
plot(x,y, main = "qnorm()", col = "blue")


## rnorm
normdis <- rnorm(n=1000, m=30, sd=3)
hist(normdis)

data("ToothGrowth")
head(ToothGrowth)
str(ToothGrowth)

hist(ToothGrowth$len)

#qqplot
qqnorm(ToothGrowth$len)
qqline(ToothGrowth$len)

# Shapiro-Wilk normality test 
#H0: data are normally distributed
shapiro.test(ToothGrowth$len) #data are normally distributed


head(ToothGrowth)

# R has four in built functions to generate binomial distribution.
## dbinom(k, n, p)
# This function is used to find probability at a particular value for a data 
# that follows binomial distribution
dbinom(3, size = 13, prob = 1 / 6) 
probabilities <- dbinom(x = c(0:10), size = 10, prob = 1 / 6) 
data.frame(x, probabilities) 
plot(0:10, probabilities, type = "l")
pbinom(k, n, p)
qbinom(P, n, p)
rbinom(n, N, p)

##########################################
## SAT score
pnorm(1800, mean = 1500, sd = 300)

## Friend
qnorm(0.90, 1500, 300)

## checked baggage
pnorm(50, mean = 45, sd = 3.2)

# 1 succes in 4 trials
choose(4, 1)

choose(9, 2)
