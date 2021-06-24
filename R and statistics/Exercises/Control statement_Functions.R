################################################################
##################### Relational Operator ######################
################################################################

#### EQUALITY ==

TRUE == TRUE
TRUE == FALSE
"hello" == "goodbye" # g comes first in alphabetical order
3 == 2

A <- c("AGCTGCTA")
B <- c("AGCCGCTA")
A

A != B

#### INEQUALITY !=

TRUE != TRUE
TRUE != FALSE
"hello" != "goodbye" # g comes first in alphabetical order
3 != 2


# Compariosn of numerics
-6 * 14 != 17 - 101

# Comparison of character strings
"useR" == "user"
"raining" < "raining dogs"

# Compare a logical with a numeric
TRUE == 1

#### < and >

3 < 5
3 > 5
"HELLO" > "goodbye"  # Alphabetical order

TRUE < FALSE  


#### <= and >= 
5 >= 3
5 <= 3


#### Relational operators and vectors
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
linkedin
class(linkedin)

linkedin > 10

facebook <- c(17, 7, 5, 16, 8, 13, 14)
facebook

facebook <= linkedin

# linkedin popular days
linkedin > 15

# linkedin quiet days
linkedin <= 5

# linkedin more popular than facebook
linkedin > facebook # it will check each day one by one 

################################################################
#################### Conditional Statement #####################
################################################################

########### if statement 
if(condition) {
  expr
}

a <- -3

if(a == 0){
  print("a is zero")
}

if(a < 0){
  print("a is a negative number")
}

v <- c(14,7,6,9,2)
ifelse(v %% 2 == 1,"odd","even")

#### Nested condition
x <- 42
if (x > 1){
  print("More than one")
  if (x < 100){
    print("Less than 100")
  }
}

#### If else statement
if(condition){
  expr1
} else {
  expr2
}

a <- 3

if(a < 0){
  print("a is a positive number") 
} else {
  print("a is either a negative number or zero")
}

x <- 4
if (x > 2){
  print("Bigger")
} else{
  print("smaller")
}

#### else if statement
if(condition1){
  expr1
} else if(condition2){
  expr2
} else {
  expr3
}

c <- 0

if(c < 0) {
  print("c is a negative number")   
} else if(c == 0){
  print("c is a zero")  
} else {
  print("C is positive number")
}

x <- 6
if (x %% 2 == 0){
  print("divisible by two")
} else if(x %% 3 == 0){
  print("divisible by three")
} else{
  print("neither divisible by two or three")
}

### Adding columns using ifelse
x <- data.frame("Student" = c("Ron","Jake","Ava","Sophia","Mia"),"Marks" = c(35,75,45,30,85))
x
x$Result <- ifelse(x$Marks > 40, "Pass", "Fail")
x
################################################################
########################## For loop ############################
################################################################
## FOR loop
for (i in seq) {
  expr
}

A <- 1:5
print(A)

for (var in A){
  print(var)
}
# i is iteration variable and 1: 5 is sequence
# print(i) is your block body of code. It will execute each value in the sequence.

for (i in 1:5){
  print(i)
}

even <-  c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
for (n in even){
  print(n)
}

# OR
# seq(start, stop, step)
seq(0, 20, 1)

for (n in seq(2, 20, 2)){
  print(n)
}

# sequence function: first position is starting, second is finsihing and third is space

for (i in seq(1, 10, 2)){
  print(paste("i is now", i))
}

fruit <- c("Apple", "Pear")
print(nchar(fruit))
length(fruit)

# nchar will count all alphabets

number <- "9,223,372,036,854,775,807"
for (i in seq(3, nchar(number))){
  print(i)
}
nchar(number)

# Print largest number
largest <- 15

x <- c(9, 41, 12, 3, 74, 15)

for (i in x){
  if (i > largest){
    largest = i
    print(largest)
  }
}

cities <- c("New York", "Paris", "London", "Tokyo", "Mumbai", "Rio de Janerio", 
            "Cape Town")

for(city in cities) {
  print(city)
}

#### break statement
for (city in cities){
  if (nchar(cities) == 6){
    break
  }
  print(city)
}

# for loop abondened before London as nchar = 6 for, so no print out

# next statement
for(city in cities){
  if(nchar(city) == 6){
    next    # next: skip to next itireation
  }
  print(city)
}
# "London" will not be printed

# Write table
# 2 x 1 = 2
for (i in 2:10){
  for(j in 1:10){
    print(paste(i, "x", j, "=", i*j))
  }
}

################################################################
########################## While ###############################
################################################################
while(condition){
  expr
}

x = 0
while (x <= 20){
  print(x)
  x = x + 2   # this step is called incrementing and we are incrementing it by 2
}


ctr <- 1
while(ctr <= 7) {     # TRUE
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1      # increment ctr
}

#### break statement
ctr <- 1
while(ctr <= 10){     # TRUE
  if(ctr %% 5 == 0) {
    break            # Break if ctr is a 5-fold
  }
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1     # increment
}

################################################################
################ Functions and Expressions #####################
################################################################

# A function takes arguments as input and returns an object as output.
# There are functions to do all sorts of things.
# Example: list(), 
# print(), mean(), sd()
# Functions work like a black box
# Argument matching: by position or by name
# Function arguments can have defaults

my_fun <- function(arg1, arg2)
{body
}

# Lets write first function
coin_sides <- c("head", "tail")

# Sample from coin_sides once
sample(coin_sides, size = 3, replace = TRUE)

# Write a template for your function, toss_coin()
toss_coin <- function() {
  # (Leave the contents of the body for later)
  # Add punctuation to finish the body
}

# Your script, from a previous step
# Paste your script into the function body
toss_coin <- function() {
  coin_sides <- c("head", "tail")
  sample(coin_sides, 1)
}

# Call your function
toss_coin()

3 * x
# The triple() function
triple <- function(x){
  3 * x
}

triple(8) # numeric 6 matched to argument x(by pos). Function body is executed: 3 * 6


triple <- function(x){
  y <- 3 * x
  return(y)
}

triple(6)


a*b + a/b
# math magic function
math_magic <- function(a, b) {
  a*b + a/b
}
math_magic(4, 2) # a & b arguments are present

# Multiple inputs to functions
coin_sides <- c("head", "tail")
n_flips <- 10
p_head <- 0.8

# Define a vector of weights
weights <- p_head + (1 - p_head)

# Update so that heads are sampled with prob p_head
sample(coin_sides, n_flips, replace = TRUE, prob = c(0.8,  0.2))

# Update the function so heads have probability p_head
toss_coin <- function(n_flips, p_head) {
  coin_sides <- c("head", "tail")
  # Define a vector of weights
  weights <- c(p_head, 1 - p_head)
  # Modify the sampling to be weighted 
  sample(coin_sides, n_flips, replace = TRUE, prob = weights)
}

# Generate 10 coin tosses
toss_coin(100, 0.6)

# mean = total/n
y <- c(5, 4, 3)
mean(y)
sum(y)
length(y)

mean_y <- function(x){
  sum(x)/length(x)
}
mean_y(y)


################################################################
################ Other Important Functions #####################
################################################################
## LOADS OF USEFUL FUNCTION
### mean, sum, round, abs

# Mathematical utilities
v1 <- c(1.102587412, -7.1, 5.4, -2.7)
v2 <- c(-3.6, 4.1, 5.8, -8.0)
sum(round(abs(v1)))

mean(c(sum(round(abs(v1))), sum(round(abs(v2)))))  # first absolute value of v1 and v2, then round the digits and the addition of v1 and v2, after that it will calculate mean   
sum(round(abs(v2)))
round(abs(v1), 3)

a <- c(-1.10845)
round(a, 2)
abs(a)


### sort, rep & seq
seq(8, 2, by = -2)
rep(seq(8, 2, by = -2), times = 2)
sort(rep(seq(8, 2, by = -2), times = 2))

## REGULAR EXPRESSION

# * Sequence of (meta)characters
# * Pattern existence
# * Pattern Replacement
# * Pattern extraction
# * grep(), grepl()
# * sub(), gsub()

#### grepl()
animals <- c("cat", "moose", "impala", "ant", "kiwi")

grepl(pattern = "a", x = animals) # it will tell if 'a' is present in animal types

grepl(pattern = "^a", animals) # it will tell, if a is first alphabet

grepl("a$", animals) # if more than one "a" is present


#### grep()
grep("a", animals) # rather than TRUE FALSE, it provides indices

grep("^a", animals) 

grep("a$", animals)


#### sub(), gsub()
sub(pattern= "a", replacement = "o", x = animals) # it will replace only one a with o

gsub("a", "o", animals) # it will replace all a's with o

gsub("a|i", "-", animals) # we can replace more than one alphabet from a word
gsub("a|i|c", "o", animals)

## TIMES & DATES
# today, right now
today <- Sys.Date()
today
class(today)

# time now
now <- Sys.time()
now
class(now)

# Create date objects
my_date <- as.Date("1947-08-15")  # Default format "%Y-%m-%d"
my_date
# %Y = 4-digit year, %m = 2-digit month, %d = 2-digit day
class(my_date)



# Create POSIXct objects
my_time <- as.POSIXct("1947-08-15 00:00:00")
my_time
class(my_time)


# Date arithmatic
my_date + 1 # days increment by 1

my_date2 <- as.Date("2021-02-20")
my_date2 - my_date
today - my_date

################################################################
############################ Apply #############################
################################################################


### APPLY FUNCTION

# lets look for apply function
?apply


my.matrix <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3)
my.matrix

apply(my.matrix, 2, sum) # here 1 indicates rows, if 2 it means columns

# Using it for statistics
# caluclate standard error

apply(my.matrix,2, mean)

# lapply
# lapply applies treats the vector like a list
# apply function over list or vector
# output = list
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

print(nyc)
# We can use a for loop to find class of nyc list
for(i in nyc) {
  print(class(i))
}


# Similar things can be done using apply function
lapply(nyc, class)

cities <- c("New York", "Paris", "London", "Tokyo", "Rio de Janerio", "Cape Town")


num_chars <- c()
for(i in 1:length(cities)){
  num_chars[i] <- nchar(cities[i])
}
num_chars

# OR
lapply(cities, nchar)
unlist(lapply(cities, nchar))



# lapply for calculation
prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)

# now we want to multiply each by 3
triple <- function(x) {
  3 * x
}

result <- unlist(lapply(prices, triple))
result
str(result)
unlist(result)


# doing multiplication multiple time
multiply <- function(x, factor){
  x * factor
}

times3 <- lapply(prices, multiply, factor = 3) # multiply by 3
unlist(times3)


# sapply()
# apply function over list or vector 
# try to simplify list to array
# rather than returning a list like lapply, it will return a vector
# makes output much easier
lapply(cities, nchar)
sapply(cities, nchar)
sapply(cities, nchar, USE.NAMES = FALSE) # USE.NAMES is TRUE by default
