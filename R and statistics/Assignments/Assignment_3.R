########################### ASSIGNMENT_3 ##################################

#### DATA CLEANING ####

# Importing data
library(readr)
d1=read.csv("F:/Grey_Campus/datasets/3.COVID19.csv")

# Replacing blank cells with NAs
d1[d1==""]=NA

# Keeping rows with only country
d2=d1[9:229,]

# Removing unwanted columns
d3=d2[-c(1,2)]

# Correcting the serial numbers
row.names(d3) = NULL

# Calculating percentage of NA values
Missing_percent=function(x){
  (sum(is.na(x))/length(x))*100
}
missing_perc= apply(d3, 2, Missing_percent)
which(missing_perc>10)

# Removing columns with more than 10% NAs 
covid_data=d3[-c(3,5,7,9)]
str(covid_data)

# Converting numbers to numeric format and continent to factor format
data=covid_data[,c(1,11)]
chr_data=covid_data[,-c(1,11)] 

for(i in 1:ncol(chr_data)) {     
  chr_data[,i]=as.numeric(gsub(",","",chr_data[,i]))
}

covid_data=cbind(data,chr_data)
covid_data$Continent=as.factor(covid_data$Continent)

# Renaming column names
names(covid_data)=c("Country","Continent", "Total Cases","Total Deaths","Total recovered",
                    "Active Cases","Cases/1M pop","Death/1M pop",
                    "Total Tests","Test/1M pop","Population",
                    "X1 Case every X ppl","X1 Death every X ppl",
                    "X1 Test every X ppl")
head(covid_data)
str(covid_data)

#Q1)
library("ggpubr")
ggdensity(covid_data$`Total Cases`, 
          main = "Density plot for Total Cases",
          xlab = "Total Cases")
summary(covid_data$`Total Cases`)

ggdensity(covid_data$`Total Deaths`, 
          main = "Density plot for Total Deaths",
          xlab = "Total Deaths")
summary(covid_data$`Total Deaths`)

ggdensity(covid_data$`Total recovered`, 
          main = "Density plot for Total Recovered",
          xlab = "Total Recovered")
summary(covid_data$`Total recovered`)

## From above density plots it is clear that our data i.e, Total cases, 
## total deaths and total recovered do not follow Normal distribution.
## Also the data is right skewed. The summary() gives the numerical values,
## where it can be observed that Median < Mean.

#Q2)
library(ggpubr)
ggscatter(covid_data,x="Total Cases",y="Population",
          main="Scatter Plot for Population vs Total Cases", add="reg.line",
          cor.coef =TRUE)
##There is low positive correlation between Population and Total Cases.

#Q3)
ggscatter(covid_data,x="Population",y="Cases/1M pop",
          main="Scatter Plot for Population vs Total Cases per 1M population",
          add="reg.line",cor.coef =TRUE)

##There is no correlation between Population and Total cases per 1M population.

#Q4)
# The column "Cases/1M pop" is better for comparision purpose than the
# column "Total Cases". The population of countries differ in size so the 
# "Total Cases" will only give the number of infections irrespective of 
# population size which cannot falicitate proper comparision. On the other
# hand the column "Cases/1M pop" is the ratio quantity, here we know 
# that the total number of cases is per million people. Also it is unitless,
# thus makes comparision easier.

#Q5)
ggscatter(covid_data,x="Total Cases",y="Total Deaths",
          main="Scatter Plot for Total Cases vs Total Deaths",
          add="reg.line",cor.coef =TRUE)

# The plot shows there is high positive correlation between Total number of
# cases and Total Deaths i.e, as the number of cases increases the number of 
# deaths also increase.

#Q6)
ggscatter(covid_data,x="Total Cases",y="Death/1M pop",
          main="Scatter Plot for Total Cases vs Death/1M pop",
          add="reg.line",cor.coef =TRUE)

# There is no correlation between Total_Cases and Death/1M pop i.e, death/1M
# doesnot change with change in Total number of Cases. Death/1M is suitable 
# for comparison.

#Q7)
boxplot(`Cases/1M pop`~ Continent,data=covid_data)

# The boxplot shows that Europe has highest number of Cases per million population
# and Australia has least number of cases followed by Africa. 

#Q8)
boxplot(`Death/1M pop`~ Continent,data=covid_data)

# From boxplot it is clear that total number of deaths per million population
# is also greater in Europe. Australia has least deaths. It is also observed 
# that the sequence of continents in both plots (Deaths per 1 million 
# population and Cases per 1 million population) is almost similar.

#Q9)
barplot(`Test/1M pop` ~ `Country`,data=covid_data, las=2)
covid_data$Country[which.max(covid_data$`Test/1M pop`)]
covid_data$Country[which.min(covid_data$`Test/1M pop`)]

# The column Test per 1 million must be used as it is irrespective of population
# of the country. "Gibraltar" is best in testing cases while "Yemen" is worst.

#Q10)
boxplot(`Test/1M pop` ~ `Continent`, data = covid_data)

# Highest number of test is carried out by Europe and minimum by Australia.

#Q11)
ggdensity(covid_data$`Test/1M pop`, 
          main = "Density plot for Test per million population",
          xlab = "Test per million population")

# Test per million population is also right skewed data.

