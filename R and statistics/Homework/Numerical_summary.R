####### Measures of Central Tendency
library(ggplot2)
## Mean (Average)
head(mtcars)

hist(mtcars$mpg)
mean(mtcars$mpg)
mean(airquality$Ozone, na.rm = TRUE)

## Median
median(mtcars$mpg)
median(airquality$Ozone, na.rm = TRUE)

## Mode
# Create the function.
y <- table(mtcars$mpg)
y
names(y)[which(y==max(y))]

  
  
## Midrange
(max(mtcars$mpg) + min(mtcars$mpg)/2)


## Geomtric mean
library(EnvStats)
geoMean(mtcars$mpg)

####### Measures of Dispersion

## Range
range(mtcars$mpg) #minimum to maximum 

## Interquartile range
IQR(mtcars$mpg)

## Summary
summary(mtcars$mpg)

## Variance
var(mtcars$mpg)

## Standard deviation
sd(mtcars$mpg)

## Coefficient of variation
cv(mtcars$mpg)

## Standard error
library(sciplot)
se(mtcars$mpg)

########### Skewness
# skewness is a measure of the asymmetry 
time <- c(19.09, 19.55, 17.89, 17.73, 25.15, 27.27, 25.24, 21.05, 21.65, 20.92, 22.61, 15.71, 22.04, 22.60, 24.25)
hist(time)

library(moments) # for skewness
skewness(time) 


## Right skewed

# right skew: mean>median
# few larger values increase the mean

right_skewed <- c(10, 10, 11, 12, 10, 11, 12, 13, 11, 12, 11, 12, 16, 13, 11, 10, 14, 12, 15, 13, 17, 18)
hist(right_skewed)
skewness(right_skewed)

## Left Skewed

# left skew: mean < median
# few smaller values reduce the mean

left_skewed <- c(10, 10, 11, 12, 10, 11, 12, 13, 11, 12, 11, 12, 5, 13, 11, 10, 8, 12, 9, 13, 7, 6)

skewness(left_skewed)

hist(left_skewed)
