# Basic R Operations and Concepts
## Arithmetic
2 + 3 # add

4 * 5 / 6 # multiply and divide

7^8 # 7 to the 8th power

# Anything typed after a "#" symbol is ignored by R.
options(digits = 16) # see more digits
10/3 

sqrt(4) # square root

exp(1) # Euler's constant, e

pi

options(digits = 7) # back to default
pi

# Assignment, Object names, and Data types
x <- 7*41/pi # don't see the calculated value

x # take a look
print(x)

################################################################
################### Wroking Directory ##########################
################################################################
getwd()    ## Find the working directory on which we are.
setwd()    ## Changes the working directory to desired location.


################################################################
####################### Vector #################################
################################################################

# 74, 31, 95, 61, 76, 34, 23, 54, 96
# c is concatenation 
my_numeric <- c(74, 31.5, 95.2, 61.35, 76.25555, 34.5, 23.5, 54.2, 96.0) 
my_numeric
print(my_numeric)

my_character <- c("USA", "India", "Brazil")
my_character

my_logical <- c(TRUE, FALSE, TRUE)
my_logical

my_integers <- c(16942980, 9906507, 6929409)
my_integers

## Checking class of a vector
class()
typeof(my_numeric)
class(my_numeric)
class(my_character)
class(my_logical)
class(my_integers)

######## Naming a vector ##########

# Number of cases in USA from Monday to Friday
USA_vector <- c(14000, 50000, 20000, 12000, 24000) 
USA_vector

# Number of cases in India from Monday to Friday
India_vector <- c(24000, 50000, 15000, 35000, 10000)
India_vector

# Naming a vector 
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
days_vector

# Now assign days vector 
names(USA_vector) <- days_vector
class(USA_vector)
View(USA_vector)
names(India_vector) <- days_vector
India_vector

######### Adding vectors ###########
total_daily <- USA_vector + India_vector
total_daily

# Adding total for USA
total_USA <- sum(USA_vector)
total_USA

# Adding total for India
total_India <- sum(India_vector)
total_India

# Total cases
total_week <- total_USA + total_India
total_week


########## Subsetting a vector ############

# In R indexing starts from 1
USA_vector

# subsetting wednesday using 3 
USA_wednesday <- USA_vector[3]
USA_wednesday

# subsetting midweek 

# we can use ":" symbol to subset
USA_midweek <- USA_vector[2:4]
USA_midweek

# Selecting Monday, Tuesday and Wednesday 
USA_start <- USA_vector[c("Monday", "Wednesday")]
USA_start

# repeated data
seq(from = 1, to = 5)

seq(from = 2, by = -0.1, length.out = 2)

1:5

LETTERS
LETTERS[1:5]

letters
letters[-(6:26)]
# we used the minus sign to specify those elements that we do not want.

########## Mixing objects ##############
y <- c(1.7, "a") ## character
y
class(y)

y <- c(TRUE, 2) ## numeric
class(y)

y <- c("a", TRUE) ## charcter
class(y)

#### Explicit coercion
x <- 0:6
x
class(x)

y <- as.numeric(x)
class(y)

as.logical(x)

y <- as.character(x)
class(y)

#### Illogical coercion
x <- c("a", "b", "c")

y <- as.numeric(x)
y

as.logical(x)

##### cbinding and rbinding
x <- 1:3
x
y <- 10:12
y
cbind(x, y)
rbind(x, y)

################################################################
######################## Matrix ################################
################################################################
matrix()
matrix(1:9, byrow = TRUE, nrow = 3)

# Top three countries with corona
USA <- c(16942980, 308091)
India <- c(9906507, 143746)
Brazil <- c(6929409, 181945)

Top_three <- c(USA, India, Brazil)
Top_three

# Construct matrix
Top_matrix <- matrix(Top_three, nrow = 3, byrow = TRUE)
Top_matrix


### Naming a matrix
# Vector region for column name and titles for row names
Number <- c("Total case", "Total Death")
Country <- c("USA", "India", "Brazil")

# Name the columns with region
colnames(Top_matrix) <- Number

# Name the rows with title 
rownames(Top_matrix) <- Country
Top_matrix


### Adding colums in matrix(colSums) or rowSums
Top_three_c <- c(16942980, 308091, 9906507, 143746, 6929409, 181945)
Top_matrix_1 <- matrix(Top_three_c, nrow = 3, byrow = TRUE, 
                       dimnames = list(c("USA", "India", "Brazil"), c("Total Case", "Total Death")))

Top_matrix_1

worldwide_total <- colSums(Top_matrix_1)
worldwide_total

### Checking dimensions and attributes
m <- matrix(1:100, nrow = 4)
m

dim(m)

## Subsetting a matrix
x <- matrix(1:6, 2, 3)
x

x[1, 2]

x[2, 1]

x[1, ]
x[, 2]

# By default, when a single element of a matrix is retrieved, it is 
# returned as a vector of length 1 rather than a 1 × 1 matrix. This 
# behavior can be turned off by setting drop = FALSE.
x[1, 2, drop = FALSE]

x[1, ]
x[1, , drop = FALSE]

################################################################
######################## Factor ################################
################################################################

#################### Unorder factors
Gender_vector <- c("Male", "Female", "Female", "Male", "Male")
class(Gender_vector)
table(Gender_vector)
Gender_vector

# Convert Gender vector to factor
factor_Gender_vector <- factor(Gender_vector, 
                               levels = c("Male", "Female"))
factor_Gender_vector
class(factor_Gender_vector)
levels(factor_Gender_vector)

### Factors levels and summary
# Sometimes we want to change names of the levels using level() function

################### Order factors

# Create speed vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast", "slow", "fast", "fast")
class(speed_vector)
table(speed_vector)

# convert speed vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, 
                              levels = c("slow", "medium", "fast"))
factor_speed_vector
summary(factor_speed_vector)

################################################################
######################## Data Frame ############################
################################################################

# mtcars is a built in dataframe
# head(): enables to show first six observations
mtcars
head(mtcars, 2)
table(mtcars$mpg)
# tail(): enables to show last six observations
tail(mtcars)

# str(): shows the structure of the data sets such as number of observations and variables. It also tells class of variables
str(mtcars)

# There are several ways to crate a dataframe. We may already receive a file with dataframe or we may have to generate a dataframe from vecotrs
# Defining vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")

type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")

diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)

rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)

rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Creating dataframe from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)
planets_df

str(planets_df)

###### Subsetting dataframe
# Print out diameter of Mercury
planets_df[1, 3]

# Print out data of Mars
planets_df[4, ]

# Select first 4 values of diameter column
planets_df[1:4, "diameter"]

# Select rings variable from planets_df
# This will provide TRUE or FALSE value
rings_vector <- planets_df$rings
rings_vector

# Selecting all columns for planet with rings
ring_true <- planets_df[rings_vector, ]
ring_true

# Select or subset planets with diameter < 1
subset(planets_df, diameter < 1)

### Order function
# Use order() to create positions
positions <- order(planets_df$diameter)
positions

# Use positions to sort planets_df
planets_df[positions, ]

################################################################
###################### Logical operators #######################
################################################################
### Logical operator 
# AND operator &
# OR operator |
# NOT operator !

# AND operator &
# only TRUE if both are TRUE
# FALSE otherwise
TRUE & TRUE   
FALSE & TRUE
TRUE & FALSE
FALSE & FALSE   

x <- 12
x > 5 & x < 15

# OR operator |
# TRUE if at least one is TRUE
# Only FALSE if both FALSE
TRUE | TRUE
TRUE | FALSE   
FALSE | TRUE
FALSE | FALSE  
y <- 14
y < 5 | y > 12

# NOT operator !
!TRUE
!FALSE
!(x < 5)

### Logical operators and vectors
c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE) & c(FALSE, FALSE, FALSE)
c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
!c(TRUE, TRUE, FALSE)

################################################################
############################ List ##############################
################################################################
## Creating a list

# Vector with numerics from 1 up to 10
my_vector <- 1:10

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in-data frame mtcars
my_df <- mtcars[1:5, ]
my_df

# Creating list with these different elements
my_list <- list(my_vector, my_matrix, my_df)
my_list

# Adding name 
my_list_1 <- list(Vector = my_vector, Matrix = my_matrix, Dataframe = my_df)
my_list_1

str(my_list_1)

##### Subsetting list
x <- list(foo = 1:4, bar = 0.6)
x
x[2]

x[[2]]

x$foo
x$bar

x["bar"]

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

name <- "foo"
name

x[[name]] ## computed index for 'foo'
x$name ## element 'name' doesn't exist!

x$foo

## Subsetting nested elements of a List
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
x[[c(1, 3)]]

x[[1]][[3]]

x[[c(2, 1)]]

################################################################
###################### Reading & Writing #######################
################################################################
##### Reading files in r #####
search()

# Installing packages in r
install.packages("readxl")# internet is must

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")

# Reading a package in r
library(readxl)
require(readr)

######### readr package
install.packages("readr")
library(readr)

# reading a csv file
state_1 <- read_csv("states.csv")
head(state_1)

state_nay <- read_csv2("state_nay.csv")
head(state_nay)

# reading a tsv file
state_1 <- read_tsv("states.txt")
head(state_1)

############# using data.table ###############
install.packages("data.table")
library(data.table)
state_1 <- fread("states.txt")
str(state_1)
head(state_1)

state_1 <- fread("states.csv")
str(state_1)
head(state_1)

state_1 <- fread("state_aye.csv")
str(state_1)
head(state_1)

############# reading excel file ###############
install.packages(readxl)
library(readxl)
# excel_sheets() list different sheets
# read_excel() import data into r

## This command will tell how many sheets do we have in excel
urban_pop <- excel_sheets("urbanpop.xlsx")
urban_pop

## This command will read first sheet of the excel
urban_pop <- read_excel("urbanpop.xlsx")
head(urban_pop)

## This command will read 'specific' assigned sheet of the excel
urban_pop <- read_excel("urbanpop.xlsx",
                        sheet = 2)
head(urban_pop)

## This command will read 'specific' assigned sheet of the excel
urban_pop <- read_excel("urbanpop.xlsx",
                        sheet = 3)
head(urban_pop)

## Rather than giving sheet number, we can give name of that sheet
urban_pop <- read_excel("urbanpop.xlsx",
                        sheet = "1960-1966")
urban_pop

####### READING SAS FILE #####

# one way of reading sas files
#File ---> Importdataset ----> From SAS
library(haven)
dataset <- read_sas("airline.sas7bdat")
head(dataset)

####### READING SPSS FILE #####
library(haven)
dataset <- read_spss("Amitr.sav")
head(dataset)

####### READING STATA FILE #####
library(haven)
dataset <- read_stata("airline.dta")
head(dataset)

#### Reading files from webpage #######

## Functional SNPS Associated with Muscle Size and Strength (FAMuSS) data
getwd()
setwd("F:/Grey_Campus/datasets")
fmsURL <- "http://www.stat-gen.org/book.e1/data/FMS_data.txt"

fms <- read.delim(file = fmsURL, 
                  header = T, 
                  sep = "\t")

head(fms)
write.table(fms, file = "F:/Grey_Campus/datasets/fms.txt",
            row.names = FALSE,
            col.names = TRUE,
            sep = "\t",
            quote = FALSE)

## HGDP dataset
HGDPURL <- "http://www.stat-gen.org/book.e1/data/HGDP_AKT1.txt"

HGDP <- read.delim(file = HGDPURL, 
                   header = T, 
                   sep = "\t")
head(HGDP)
write.table(HGDP, file = "F:/Grey_Campus/datasets/HGDP.txt",
            row.names = FALSE,
            col.names = TRUE,
            sep = "\t",
            quote = FALSE)

######### Writing files
# TEXT file
write.table(state_1, file = "state_text.csv",
            row.names = FALSE,
            col.names = TRUE,
            sep = ",",
            quote = FALSE)

# Excel file
write.table(state_1, file = "state_CSV.xlsx",
            row.names = FALSE,
            col.names = TRUE,
            sep = " ")