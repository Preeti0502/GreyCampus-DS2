################################################################
###################### Missing values ##########################
################################################################

### Dealing with missing vlaues
# vector with missing data
x <- c(1:4, NA, 6:7, NA)
x

# Check if we have NA's
is.na(x)

# data frame with missing data
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE)

df
# identify NAs in full data frame
is.na(df)

# identify NAs in specific data frame column
is.na(df$col4)

# identify location of NAs in vector
which(is.na(x))

# identify count of NAs in data frame
sum(is.na(df))

## For data frames, a convenient shortcut to compute the total missing values 
# in each column is to use colSums()
colSums(is.na(df))

###################
# recode missing values with the mean
# vector with missing data
x <- c(1:4, NA, 6:7, NA)
x
x[is.na(x)]
mean(x, na.rm = TRUE)
x[is.na(x)] <- mean(x, na.rm = TRUE)
x

round(x, 2)

# data frame that codes missing values as 99
df <- data.frame(col1 = c(1:3, 99), col2 = c(2.5, 4.2, 99, 3.2))
df

# change 99s to NAs
df[df == 99]
df[df == 99] <- NA
df

# data frame with missing data
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE)
df
mean(df$col4, na.rm = TRUE)
df$col4[is.na(df$col4)] <- mean(df$col4, na.rm = TRUE)
df

#################
# Exclude missing values
# A vector with missing values
x <- c(1:4, NA, 6:7, NA)

# We may also desire to subset our data to obtain complete observations, 
# those observations (rows) in our data that contain no missing data. 
# We can do this a few different ways.

# data frame with missing values
df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA,"is", "text"), 
                 col3 = c(TRUE, FALSE, TRUE, TRUE), 
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE)
df
complete.cases(df)
# subset with complete.cases to get complete cases
df[complete.cases(df), ]

# or subset with `!` operator to get incomplete cases
df[!complete.cases(df), ]

## An shorthand alternative is to simply use na.omit() to omit all rows 
# containing missing values.
# or use na.omit() to get same as above
na.omit(df)


#load data
data <- iris
###########################################################
###### MICE (Multivariate Imputation via Chained Equations)
## Creating multiple imputations as compared to a single imputation 
# (such as mean) takes care of uncertainty in missing values.

## MICE assumes that the missing data are Missing at Random (MAR), which means 
# that the probability that a value is missing depends only on observed value 
# and can be predicted using them. It imputes data on a variable by variable 
# basis by specifying an imputation model per variable.

## Suppose we have X1, X2..Xk variables. If X1 has missing values, then it 
# will be regressed on other variables X2 to Xk. The missing values in X1 will 
# be then replaced by predictive values obtained. Similarly, if X2 has missing 
# values, then X1, X3 to Xk variables will be used in prediction model as 
# independent variables. Later, missing values will be replaced with predicted 
# values.

## By default, linear regression is used to predict continuous missing values. 
# Logistic regression is used for categorical missing values. Once this cycle 
# is complete, multiple data sets are generated. These data sets differ only in
# imputed missing values. Generally, it's considered to be a good practice to 
# build models on these data sets separately and combining their results.

## Precisely, the methods used by this package are:
# 1. PMM (Predictive Mean Matching) - For numeric variables
# 2. logreg(Logistic Regression) - For Binary Variables( with 2 levels)
# 3. polyreg(Bayesian polytomous regression) - For Factor Variables (>= 2 levels)
# 4. Proportional odds model (ordered, >= 2 levels)

#Get summary
summary(iris)
sum(is.na(iris))

#Generate 10% missing values at Random
library(missForest)
iris.mis <- prodNA(iris, noNA = 0.1)
sum(is.na(iris.mis))

# Removing categorical data
iris.mis <- subset(iris.mis, select = -c(Species))
summary(iris.mis)
head(iris.mis,17)
library(mice)

imputed_Data <- mice(iris.mis, m=5, maxit = 50, method = 'pmm', seed = 500)
summary(imputed_Data)

## Here is an explanation of the parameters used:
# m - Refers to 5 imputed data sets
# maxit - Refers to no. of iterations taken to impute missing values
# method - Refers to method used in imputation. we used predictive mean matching.

#check imputed values
imputed_Data$imp$Sepal.Width

################################################################
##################### Data manipulation ########################
################################################################
install.packages("tidyverse")
install.packages("dplyr")

library(gapminder)
library(tidyverse)

##################################### DPLYR
######## THE FILTER VERB ##########
# filter subsets observations
head(gapminder, 12)

str(gapminder)

gap_2007 <- filter(gapminder, year == 2007)
gap_2007

## Using pipe operator

### Filter
# Filtering for one year
gapminder %>%   
  filter(year == 2007)

# Filtering for India
gapminder %>% 
  filter(country == "India")

# Filter for one year and the United States together
gapminder %>% 
  filter(year == 2007, country == "India")


######## THE ARRANGE VERB ########
# arrange() sorts a table based on a variable
gapminder %>% 
  arrange(gdpPercap)

# sorting in descending order
gapminder %>% 
  arrange(desc(gdpPercap))

# filtering and then arranging
gapminder %>% 
  filter(year == 2007) %>% 
  arrange(desc(gdpPercap))

### Slice function
head(gapminder)
gapminder %>% 
  slice(3:5)

gapminder %>% 
  slice_head(n = 3)

gapminder %>% 
  slice_tail(n = 3)

gapminder %>% 
  slice_sample(n = 5)

gapminder %>% 
  slice_sample(prop = 0.1)

########## THE MUTATE VERB #######
# mutate() changes or adds variables

# changing a variable
gapminder %>% 
  mutate(per = pop /1000000)

# adding a new variable
gapminder %>% 
  mutate(gdp = gdpPercap * pop)


#Question# Combining all verbs get results of 2007, create new column gdp,
# then arrange then on desc order


########### Summarize verb ########
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))

########### Summarizing one year ###########
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            medianLifeExp = median(lifeExp))

str(gapminder)
# Summarizing into multiple columns
gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))

str(gapminder)
# The group_by verb 
### Summarizing by year
head(gapminder)
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))

## Summarizing by continent
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(as.numeric(pop)))

## Summarizing by continent and year
gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(pop),
            meanLifeExp = mean(lifeExp))

########### Select ############## 
head(gapminder, 2)

gapminder %>%   
  select(country:lifeExp)

gapminder %>% 
  select(1:4)

gapminder %>% 
  select(year:gdpPercap)

gapminder %>% 
  select(3:6)

gapminder %>% 
  select(country, continent, pop)

gapminder %>% 
  select(-1:-2, -5)

gapminder %>% 
  select(country, continent, pop)

gapminder %>% 
  select(1, 2, 5)

gapminder %>% 
  select(-pop)

gapminder %>% 
  select(-5)

##########################################
# joining data with dplyr

library(dplyr)
df_primary <- tribble(
  ~ID, ~y,
  "A", 5,
  "B", 5,
  "C", 8,
  "D", 0,
  "F", 9)
df_secondary <- tribble(
  ~ID, ~y,
  "A", 30,
  "B", 21,
  "C", 22,
  "D", 25,
  "E", 29)

left_join(df_primary, df_secondary, by ='ID')
right_join(df_primary, df_secondary, by = 'ID')
inner_join(df_primary, df_secondary, by ='ID')
full_join(df_primary, df_secondary, by = 'ID')



df_primary <- tribble(
  ~ID, ~year, ~items,
  "A", 2015,3,
  "A", 2016,7,
  "A", 2017,6,
  "B", 2015,4,
  "B", 2016,8,
  "B", 2017,7,
  "C", 2015,4,
  "C", 2016,6,
  "C", 2017,6)
df_secondary <- tribble(
  ~ID, ~year, ~prices,
  "A", 2015,9,
  "A", 2016,8,
  "A", 2017,12,
  "B", 2015,13,
  "B", 2016,14,
  "B", 2017,6,
  "C", 2015,15,
  "C", 2016,15,
  "C", 2017,13)
left_join(df_primary, df_secondary, by = c('ID', 'year'))

df_primary <- tribble(
  ~ID, ~year, ~items,
  "A", 2015,3,
  "A", 2016,7,
  "A", 2017,6,
  "B", 2015,4,
  "B", 2016,8,
  "B", 2017,7,
  "C", 2015,4,
  "C", 2016,6,
  "C", 2017,6)
df_secondary <- tribble(
  ~ID, ~year, ~prices,
  "A", 2015,9,
  "A", 2016,8,
  "A", 2017,12,
  "B", 2015,13,
  "B", 2016,14,
  "B", 2017,6,
  "C", 2015,15,
  "C", 2016,15,
  "C", 2017,13)


band_members
band_instruments

## Semi join gives you information of common keys in first file
band_members %>% semi_join(band_instruments)

## Anti join tells you uncommon key in first file 
band_members %>% anti_join(band_instruments)
band_instruments %>% anti_join(band_members)



############################################################################
############################## tidyr package
### gather
messy <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)
messy

longer <- messy %>%
  gather(drug, heartrate, a:b)
longer

### spread
shorter <- longer %>%
  spread(drug, heartrate)
shorter

### separate
set.seed(123)
messy <- data.frame(
  id = 1:4,
  trt = sample(rep(c('control', 'treatment'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

messy

tidier <- messy %>%
  gather(key, time, -id, -trt)

tidier

tidy <- tidier %>%
  separate(key, c("location", "T"), sep = "[.]")

tidy

### Unite
Unite <- tidy %>%
  unite(key, c("location", "T"), sep = "_")
Unite

##################################################################
################## forcats
library(forcats)
library(dplyr)

starwars <- starwars
starwars
species <- starwars %>% 
  filter(!is.na(species)) %>%
  count(species, sort = TRUE)

species

# fct_lump(): Collapsing the least/most frequent values of a factor into "other".
species <- starwars %>%
  filter(!is.na(species)) %>%
  mutate(species = fct_lump(species, n = 3)) %>%
  count(species)

species


starwars %>%
  count(skin_color, sort = TRUE)



# let's keep skin colors that at least 10% of the characters have

starwars %>%
  mutate(skin_color = fct_lump(skin_color, prop = .1)) %>%
  count(skin_color, sort = TRUE)


avg_mass_eye_color <- starwars %>%
  mutate(eye_color = fct_lump(eye_color, n = 6)) %>%
  group_by(eye_color) %>%
  summarise(mean_mass = mean(mass, na.rm = TRUE))
avg_mass_eye_color


