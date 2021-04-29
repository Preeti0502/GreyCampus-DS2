##############################################################
########################## Base ##############################
##############################################################
# Data visualization with base R

# Basic box plots
# Box plot of one variable
head(ToothGrowth)
boxplot(ToothGrowth$len)
# Box plots by groups (dose)
# remove frame
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE)
# Horizontal box plots
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        horizontal = TRUE)

# Notched box plots
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        notch = TRUE)

# Change group names
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        names = c("D0.5", "D1", "D2"))

# Change color
# Change the color of border using one single color
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        border = "steelblue")

# Change the color of border.
#  Use different colors for each group
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        border = c("#999999", "#E69F00", "#56B4E9"))

# Change fill color : single color
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        col = "steelblue")

# Change fill color: multiple colors
boxplot(len ~ dose, data = ToothGrowth, frame = FALSE,
        col = c("#999999", "#E69F00", "#56B4E9"))


# Box plot with multiple groups
boxplot(len ~ supp*dose, data = ToothGrowth,
        col = c("white", "steelblue"), frame = FALSE)

# Change main title and axis labels
# Change axis titles
# Change color (col = "gray") and remove frame
# Create notched box plot
boxplot(len ~ dose, data = ToothGrowth,
        main = "Plot of length by dose",
        xlab = "Dose (mg)", ylab = "Length",
        col = "lightgray", frame = FALSE)

## Scatter plot
# adding title
head(airquality)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

# adding colour
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))

# Base Plot with Annotation
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

# Base Plot with Regression Line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

# Generic plot
x <-1:10; y <- x*x

# scatter plot
plot(x, y, type="b")
plot(x, y, type="h")
plot(x, y, type="s")




library(datasets)
airquality
# histogram
hist(airquality$Ozone)

airquality <- transform(airquality, Month = factor(Month))
str(airquality)

# boxplot
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")



# R base scatter plot: plot()
x <- mtcars$wt
y <- mtcars$mpg
# Plot with main and axis titles
# Change point shape (pch = 19) and remove frame.
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)

# Add regression line
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "blue", lwd = 2)

# Add loess fit
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
lines(lowess(x, y), col = "blue")

# Scatter Plot Matrices - R Base Graphs
# Basic plots:
head(iris)
pairs(iris[,1:4], pch = 19)

# Show only upper panel:
pairs(iris[,1:4], pch = 19, lower.panel = NULL)
table(iris$Species)

# Color points by groups (species)
my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)


# Bar Plots - R Base Graphs
x <- VADeaths[1:3, "Rural Male"]
x

# Bar plot of one variable
barplot(x)
# Horizontal bar plot
barplot(x, horiz = TRUE)

# Change group names
barplot(x, names.arg = c("A", "B", "C"))

# Change color

# Change border and fill color using one single color
barplot(x, col = "white", border = "steelblue")

# Change the color of border.
#  Use different colors for each group
barplot(x, col = "white",
        border = c("#999999", "#E69F00", "#56B4E9"))

# Change fill color : single color
barplot(x, col = "steelblue")

# Change fill color: multiple colors
barplot(x, col = c("#999999", "#E69F00", "#56B4E9"))

# Change main title and axis labels

# Change axis titles
# Change color (col = "gray") and remove frame
barplot(x, main = "Death Rates in Virginia",
        xlab = "Age", ylab = "Rate")

# Stacked bar plots
VADeaths
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", 
                "lavender", "cornsilk"),
        legend = rownames(VADeaths))
head(VADeaths)

# Grouped bar plots
barplot(VADeaths,
        col = c("lightblue", "mistyrose", "lightcyan", 
                "lavender", "cornsilk"),
        legend = rownames(VADeaths), beside = TRUE)

# Define a set of colors
my_colors <- c("lightblue", "mistyrose", "lightcyan", 
               "lavender", "cornsilk")
# Bar plot
barplot(VADeaths, col = my_colors, beside = TRUE)

# Add legend
legend("topleft", legend = rownames(VADeaths), 
       fill = my_colors, box.lty = 1, cex = 1)

# Line Plots - R Base Graphs
plot(x, y, type = "l", lty = 1)
lines(x, y, type = "l", lty = 1)

# Create some variables
x <- 1:10
y1 <- x*x
y2  <- 2*y1

# Plots with multiple lines
# Create a first line
plot(x, y1, type = "b", frame = FALSE, pch = 19, 
     col = "red", xlab = "x", ylab = "y")
# Add a second line
lines(x, y2, pch = 18, col = "blue", type = "b", lty = 2)

# Add a legend to the plot
legend("topleft", legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty = 1:2, cex=0.8)

###### Pie Chart
# Create data for the graph.
x <-  c(21, 62, 10,53)
labels <-  c("London","New York","Singapore","Mumbai")

piepercent<- round(100*x/sum(x), 1)


# Plot the chart.
pie(x, labels = piepercent, main = "City pie chart",col = rainbow(length(x)))
legend("topright", c("London","New York","Singapore","Mumbai"), cex = 0.8,
       fill = rainbow(length(x)))

library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")

# Adding side by side plots
par(mfrow = c(1, 2))
plot(density(geyser$duration), main = "Duration")
plot(density(geyser$waiting), main = "Waiting time")

##########################################################################
############################### ggplot2 ##################################
##########################################################################
library(ggplot2)
library(MASS)
library(tidyr)

head(mammals)

### Grammar of graphics
# # * 2 principals
# # * Graphics = distinct layers of grammatical elements
# # * Meaningful plots through aesthetic mappings
# 
# ### Essential grammatical elements
# # * Data        The dataset being plotted
# # * Aesthetics  The scales onto which we map our data
# # * Geometries  The visual elements used for our data 
# # * Facets      Plotting small multiples
# # * Statistics  Representation of our data to aid understanding
# # * Coordinates The space on which data will be plotted
# # * Themes      All non-data ink

### Why GGPLOT2, some examples

# Scatter plot
mammals %>%
  ggplot(aes(x = body, y = brain))+
  geom_point()+
  labs(title = "Correlation between brain and body size among all animals",
       x = "Body size",
       y = "Brain size")

# Explore-statistics
ggplot(mammals, aes(x = body, y = brain))+
  geom_point(alpha = 0.5)+
  stat_smooth(method = "lm", col = "red", se = FALSE)

# Explore - Fine tuning
ggplot(mammals, aes(x = body, y = brain))+
  geom_point(alpha = 0.6)+
  coord_fixed()+
  scale_x_log10()+
  scale_y_log10()+
  stat_smooth(method = "lm", col = "red", se = FALSE)


# Geometries
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_jitter(alpha = 0.6)

# Facets
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_jitter(alpha = 0.6)+
  facet_grid(.~ Species)

# Statistics
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_jitter(alpha = 0.6)+
  facet_grid(.~ Species)+
  stat_smooth(method = "lm", se = F, col = "red")

# Coordinates
levels(iris$Species) <- c("Setosa", "Versicolor", "Verginica")
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_jitter(alpha = 0.6)+
  facet_grid(.~ Species)+
  stat_smooth(method = "lm", se = F, col = "red")+
  scale_y_continuous("Sepal Width (cm)",
                     limits = c(2, 5),
                     expand = c(0, 0))+
  scale_x_continuous("Sepal Length (cm)",
                     limits = c(4, 8),
                     expand = c(0, 0))+
  coord_equal()



ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(col = "blue")+
  geom_point(aes(x = Petal.Length, y = Petal.Width), col = "red")


# Stats basic
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_point(position = position_jitter(0.1))

# Stat summary
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 2))

# Adding error bar
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
               geom = "errorbar", width = 0.1)




# Normal distribution
head(mammals)

ggplot(mammals, aes(x = body, y = brain))+
  geom_point()

mam.new <- data.frame(body = log10(mammals$body))
head(mam.new)

ggplot(mam.new, aes(x = body))+
  geom_histogram(aes(y = ..density..))+
  geom_rug() +
  stat_function(fun = dnorm, colour = "red",
                arg = list(mean = mean(mam.new$body),
                           sd = sd(mam.new$body)))

## Bar Charts
# Only for categorical data
head(mpg)

ggplot(mpg, aes(x = class))+
  geom_bar()


ggplot(mpg)+
  geom_bar(aes(y = class))

# Stacked bar chart
ggplot(mpg, aes(class))+
  geom_bar()+
  geom_bar(aes(fill = drv))


## Dodges
ggplot(mpg, aes(class, hwy, fill = trans))+
  geom_bar(position = "dodge", stat = "identity")



## Histogram
# Only for continuous data

head(diamonds)

ggplot(diamonds, aes(carat)) +
  geom_histogram()


ggplot(diamonds, aes(carat)) +
  geom_histogram(binwidth = 0.01)



ggplot(diamonds, aes(carat)) +
  geom_histogram(bins = 200)

ggplot(diamonds, aes(y = carat)) +
  geom_histogram()

ggplot(diamonds, aes(price, fill = cut)) +
  geom_histogram(binwidth = 500)


## Frequency Polygons
# Continuous data
ggplot(diamonds, aes(price, colour = cut)) +
  geom_freqpoly(binwidth = 500)

ggplot(diamonds, aes(price, after_stat(density), colour = cut)) +
  geom_freqpoly(binwidth = 500)


## Two way scatter plots
ggplot(mtcars, aes(wt, mpg))+
  geom_point()

ggplot(mtcars, aes(wt, mpg))+
  geom_point(aes(colour = factor(cyl)))

ggplot(mtcars, aes(wt, mpg))+
  geom_point(aes(shape = factor(cyl)))


ggplot(mtcars, aes(wt, mpg))+
  geom_point(aes(size = qsec))

ggplot(mtcars, aes(wt, mpg))+
  geom_point(colour = "red", size = 3)



ggplot(diamonds, aes(carat, price))+
  geom_point(alpha = 0.1)

## Box plots
# Continous data

ggplot(mpg, aes(class, hwy))+
  geom_boxplot()



ggplot(mpg, aes(hwy, class)) +
  geom_boxplot()


ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(notch = TRUE)


ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(varwidth = TRUE)

ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(fill = "white", colour = "#3366FF")


ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 1)


ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(outlier.shape = NA) + geom_jitter(width = 0.5)

ggplot(mpg, aes(hwy, class)) +
  geom_boxplot(aes(colour = drv))



## Line Graphs

df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))

df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))

datatable(df2)

# Basic line plot with points
ggplot(data = df, aes(x = dose, y = len, group = 1))+
  geom_line() + geom_point()



# Change line type and color
ggplot(data = df, aes(x = dose, y = len, group = 1))+
  geom_line(linetype = "dashed", color = "steelblue") +
  geom_point(color = "steelblue")

# Use geom_step()
ggplot(data = df, aes(x = dose, y = len, group = 1))+
  geom_step() +
  geom_point()


# multiple groups
# Change line types and point shapes by groups
ggplot(df2, aes(x = dose, y = len, group = supp))+
  geom_line(aes(linetype = supp))+
  geom_point(aes(shape = supp))



# multiple groups
# Change line types, point shapes and colors
# Change color manually: custom color
ggplot(df2, aes(x = dose, y = len, group = supp))+
  geom_line(aes(linetype = supp, color = supp))+
  geom_point(aes(shape = supp, color = supp)) +
  scale_color_manual(values=c("#999999", "#E69F00"))



# Line plot with dates on x-axis: Time series
head(economics)



# Plot multiple time series data:
ggplot(economics, aes(x=date)) +
  geom_line(aes(y = psavert), color = "darkred") +
  geom_line(aes(y = uempmed), color="steelblue", linetype="twodash")+
  theme_classic()



# Area plot
ggplot(economics, aes(x=date)) +
  geom_area(aes(y = psavert), fill = "#999999",
            color = "#999999", alpha=0.5) +
  geom_area(aes(y = uempmed), fill = "#E69F00",
            color = "#E69F00",  alpha=0.5)+
  theme_classic()


# Pie chart
# Create Data
data <- data.frame(
  group=LETTERS[1:5],
  value=c(13,7,9,21,2)
)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() # remove background, grid, numeric labels

# Compute the position of labels
data <- data %>% 
  arrange(desc(group)) %>%
  mutate(prop = value / sum(data$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )

# Basic piechart
ggplot(data, aes(x="", y=prop, fill=group)) +
  geom_bar(stat="identity", width=0.5, color="white") +
  coord_polar("y", start=0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(y = ypos, label = group), color = "white", size=6) +
  scale_fill_brewer(palette="Set1")


#### geom_text
data=head(mtcars, 30)
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )

#### geom_lable
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_label(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )


#### # Add one annotation
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_label(
    label="Look at this!", 
    x=4.1,
    y=20,
    label.padding = unit(0.55, "lines"), # Rectangle size around label
    label.size = 0.35,
    color = "black",
    fill="#69b3a2"
  )


