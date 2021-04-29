###### Sampling techniques
require(manipulate)
library(tigerstats)

data(FakeSchool)
View(FakeSchool)
help(FakeSchool)

mu <- mean(~GPA,data=FakeSchool)
mu


############### Simple Random Sampling (SRS)
set.seed(314159)
srs <- popsamp(7,FakeSchool)
srs

xbar.srs <- mean(~GPA,data=srs)
xbar.srs

###################### Cluster Sampling
Fr <- FakeSchool %>% 
  filter(class == "Fr")

So <- FakeSchool %>% 
  filter(class == "So")

Jr <- FakeSchool %>% 
  filter(class == "Jr")

Sr <- FakeSchool %>% 
  filter(class == "Sr")

rbind(Sr, Jr)

################# Stratified Sampling
table(FakeSchool$Honors)
# honors
set.seed(1837)

# pull out the Honors students from the rest of the populations:
honors <- subset(FakeSchool,Honors=="Yes")

# Next, we take a SRS of size 3 from the Honors students:
honors.samp <- popsamp(3, honors)
honors.samp


# same method will work for non-Honors students.
set.seed(17365)
nonhonors <- subset(FakeSchool,Honors=="No") 
nonhonors.samp <- popsamp(4,nonhonors) 
nonhonors.samp

ss <- rbind(honors.samp, nonhonors.samp)
mean(ss$GPA, na.rm = TRUE)
### Multistage Sampling

MS_c1 <- popsamp(4, Sr)
MS_c2 <- popsamp(4, Jr)

##################### Systematic Sampling
#N/n
28/7
set.seed(49464)
start <- sample(1:4, 1)
start
# So, we will start with element 4, which is Daisy and choose every 4th element after that for our sample.
SS <- FakeSchool %>%
  slice(which(row_number() %% 4 == 0))
SS
mean(SS$GPA)

