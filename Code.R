
1+3 # Run: cmd + enter
# Comment: cmd + shift + C

# Common functions
# log2(4)
# cos(2)

# Two ways of help
?log # Help of ?
help(log) # Help of ?

??sin
log() # Auto-complete: Tab

# Quick R, Cookbook for R
# https://www.r-graph-gallery.com/
# https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf

# Comparison
1 == 2
1 < 2
1 <= 2
1 > 2;

# Variables
x = 10 # inside/outside of functions
y <- 10 # Assign operators: only outside of functions
x+y
# 1variable # Not allowed

#Vectorisation
vector = c(10,20,35)
log(vector)
logical_vector = c(TRUE,FALSE,TRUE)
chr_vector = c("cat","dog","chair")
ls() #list all variables
rm(chr_vector) # Remove variables

# Different effects or remove
# A: Give an list variable and remove it
list=ls()
rm(list)
# B: Remove all of the variables that we have on the environment
rm(list=ls()) 
# C: Click the "groom" icon in the Environment window

# Packagese
installed.packages() # See the packages you have installed, or click "Packages" on the right hand-side
install.packages("dplyr") # Install the package
library(dplyr) # Use the package

# Note:
# if it shows "tar: Failed to set default locale", then do this in console and restart RStudio
# system('defaults write org.R-project.R force.LANG en_US.UTF-8')
# Ref: https://stackoverflow.com/questions/3907719/how-to-fix-tar-failed-to-set-default-locale-error


# Challenges
# Challenge 1.1
#
# Which of the following are valid R variable names?
#
min_height = 1
max.height = 1
# _age = 1 # invalid
.mass = 1 # hidden variables (not shown in environment)
ls(all.names=TRUE) # list all variables including hidden ones
MaxLength = 1
# min-length = 1 # invalid
# 2widths = 1 # invalid
celsius2kelvin = 1

# Challenge 1.2
#
# What will be the value of each variable after each statement
# in the following program?
#
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

# .mass and mass are different variables

# Challenge 1.3
#
# Run the code from the previous challenge, and write a
# command to compare mass to age. Is mass larger than age?
mass-age>0

# Challenge 1.4
#
# Clean up your working environment by deleting the mass and
# age variables.
rm(mass, age)

# Challenge 1.5
#
#Install the following packages: dplyr, ggplot2, tidyr
install.packages("ggplot2")
install.packages("tidyr")
	

### MAIN DATA TYPES (and coercion)
a = c(1,2,5)
typeof(a) # double
class(a) # numeric

b = c(TRUE, FALSE, TRUE)
typeof(b) # logical
class(b) # logical

words=c("apple","orange")
typeof(words) # character
class(words) # character

# Coercion: Character <= Complex <= Numeric/Double <= Integer <= Logical
#           "Apple"                 1.7               4L
#           "TRUE"          <=====                   1    <===   TRUE

mixVector = c("Cable",1,TRUE)
mixVector
typeof(mixVector)

mixVector2 = c(0, TRUE)
mixVector2 # 0 1

mixVector3 = c(1L, TRUE)
mixVector3

num_vec = as.numeric(mixVector)
logic_vec = as.logical(mixVector2)

# Challenge 2.1
#
# Look at the help for the c() function. What kind of vector
# do you expect you will create if you evaluate the following using typeof()?
#
vec1 = c(1, 2, 3)
typeof(vec1) # double
vec2 = c('d', 'e', 'f')
typeof(vec2) # character
vec3 = c(1, 2, 'f')
typeof(vec3) # character

# log(10+ # it will show "+" instead of ">" in the console, since it's not finished)

### Factor: group of

### DATA STRUCTURES

### Vector & Sequence: exist single type through coercion
#c() -> Vector
#seq() -> Sequence
short_vect = seq(1,3,0.2) # [1] 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0
long_vect = seq(1,100,0.2)
head(long_vect, 3)
tail(long_vect)

### List: no single type, but each data has their own types
list1 = list("Cat", 27, TRUE)

### Data Frame: a matrix
# every column is a variable (vector)
# every row is an observation

# Vector |
#        |
#        |
# List  ---------

# Create a csv file "Cats.csv". Make sure that the last line is empty.

# Import Data Frame
# Set working directory
# Method 1: Session -> Set Working Directory -> 1.To Source File Direction or 2.
# Method 2: setwd("~/Downloads/Projects/RProject/Intro-to-R-workshop")
cats = read.csv("Cats.csv")

str(cats) # Summary/Description of dataframe structures
typeof(cats) # list

# Challenge 3.2
#
# Is there a factor in our cats data.frame? what is its name?
# Try using ?read.csv to figure out how to keep text columns
# as character vectors instead of factors. Load cats.csv into a 
# variable called cats1 using this extra command. Write a command
# or two to show that the factor in cats1 is now a character
# vector.

?read.csv
cats = read.csv("Cats.csv", stringsAsFactors=FALSE)

as.character(cats["coat"])


cats[2,3] # Access the 2nd row and the 3rd column
cats[,2] # Access the 2nd column
cats$weight # Access weight column
cats[c(1,3),1] # Access 1st & 3rd rows in 1st column

# combine $, c() and []
cats$coat[c(1,3)]

# Change element value of the  data.frame
cats[2,2]=6

garfield = list("marmalade",10,FALSE)
# Row bind: add a list, which could be 
rbind(cats, garfield)
# Column bind: add a vector
# cbind()

# Challenge 3.3
#
# Create a list of length two containing a character vector for
# each of the sections in this part of the workshop:
#
# 	- Data types
# 	- Data structures
#
# Create data_types and data_structures as separate vectors, and 
# populate each with the names of the data types or
# and data structures we've seen so far.

# data1 <- data.frame("data_types" = c("Character", "Complex", "Double", "Integer", "Logical"), 
                    # "data_structures" = ["Vector", "List", "Data.Frame"])
# data1
# data1 = data.frame()

data_types = c("Factor","Character", "Complex", "Double", "Integer", "Logical")
data_structures = c("Vector", "List", "Data.Frame")
data_list = list(data_types, data_structures)
data_list
data_list[[1]] 
# [1] "Factor"    "Character" "Complex"   "Double"    "Integer"   "Logical"

data_list[1]
# [[1]]
# [1] "Factor"    "Character" "Complex"   "Double"    "Integer"   "Logical"  

# Create a data frame
iphoneInfo = data.frame(model = c("iphone7", "iphone6s", "iphoneSE"),
                        weight = c(138,143,113),
                        screenIn = c(4.7,4.7,4))

# Challenge 4.1
#
# You can create a new data.frame right from within R
# with the following syntax:
#
# 	df <- data.frame(id = c('a', 'b', 'c'),
# x = 1:3,
# y = c(TRUE, TRUE, FALSE),
# stringsAsFactors = FALSE)
#
# Make a data.frame that holds the following
# information for yourself:
#
# 	- first name
# 	- last name
# 	- lucky number

df = data.frame(firstName = c("Yu-Heng", "Elin", "Stephanie", "Sun-Yuan"),
                lastName = c("Hong", "Wee", "Allison", "Zhang"),
                luckyNumber = c(5, 7, 2, 7),
                stringsAsFactors = FALSE)

mean(df$luckyNumber)
colMeans(df[3])


# DPLYR
# DATA FRAME MANIPULATION with dplyr
library(dplyr)
titanic = read.csv("https://goo.gl/4Gqsnz")

dim(titanic) # Dimension
head(titanic) # Head
summary(titanic) # Summary

# Clean Data
titanic1 = na.omit(titanic) # Delete any rows with NA values

# Pipes %>% e.g. x %>% f(y) becomes f(x,y)
titanic35 = titanic1 %>% filter(Age == 35)

# OR operator "|" in R
titanic3540 = titanic1 %>% filter(Age == 35 | Age == 40)
### Warning: don't use other OR operator "||" (only the 1st element in the vector "OR")

# %in% operator in R
titanic354045 = titanic1 %>% filter(Age %in% c(35, 40, 45))

# AND operator "&" in R
titanic35_c1 = titanic1 %>% filter(Age == 35 & Pclass == 1)
### Warning: don't use other ANR operator "&&" (only the 1st element in the vector "AND")

# Another way of doing the same filter (only with dplyr)
titanic35_c1 = titanic1 %>% filter(Age == 35, Pclass == 1)

# Challenge 5.1
#
# Produce a data frame with only those passengers that:
# I. Are males older than 30yo.
# II. Females between the ages of 5 and 60

titanicMaleOlder30 = titanic1 %>% filter(Sex == "male", Age >= 30)
titanicFemaleBetween5And60 = titanic1 %>% filter(Sex == "female", Age >= 5, Age <= 60) # 241
titanicFemaleBetween5And60 = titanic1 %>% filter(Sex == "female", Age %in% c(5:60)) # 238
titanicFemaleBetween5And60 = titanic1 %>% filter(Sex == "female", between(Age,5,60)) # 241

# Calculate mean of Class for a dataframe
mean(titanicMaleOlder30$Pclass)

#Select(dplyr)
titanicFemaleNameSexSurvived = titanic1 %>% filter(Sex == "female") %>% select(Name, Sex, Survived)
View(titanicFemaleNameSexSurvived)

# Challenge 5.2
#
# Write a single command (which can span multiple lines
# and includes pipes) that will produce a dataframe that
# has the values for Age, SibSp and Fare for males only.
# How many rows does your dataframe have and why?
titanicMale = titanic1 %>% filter(Sex == "male")
titanicMaleAgeSibSpFare = titanic1 %>% filter(Sex == "male") %>% select(Age, SibSp, Fare)

# Warning: since the select doesn't contain Sex, so it can't filter Sex
titanicAgeSibSpFare = titanic1 %>% select(Age, SibSp, Fare) %>% filter(Sex == "male") 

# GROUP_BY
SurvivedBySex = titanic1 %>% group_by(Sex) %>% summarise(meanSurv = mean(Survived))

# SD: Standard Deviation
SurvivedBySex = titanic1 %>% 
  group_by(Sex) %>%
  summarise(meanSurv = mean(Survived), stdSurv = sd(Survived))
View(SurvivedBySex)

# Challenge 5.3
#
# Calculate the average Survived value per Pclass and Sex.
# Which combination of Pclass and Sex had the highest
# Survived value and which combination had the lowest?

SurvivedBySexAndPclass = titanic1 %>% 
  group_by(Sex, Pclass) %>%
  summarise(meanSurv = mean(Survived))
View(SurvivedBySexAndPclass)

# Mutate: Add a new variable
titanic_status = titanic1 %>% mutate(Status = Age*Pclass) 
View(titanic_status)

# Apply Group_by
titanic_results = titanic_status %>% group_by(Sex) %>% summarise(meanStatus = mean(Status))
View(titanic_results)

# Challenge 5.4
#
# Let's try creating a new column:
#
# Make a new column in the titanic data frame that contains
# Fare rounded to the nearest integer. Check the head or tail
# of the data frame to make sure it worked.
#
# Hint: R has a round() function

titanic_rounded_fare = titanic1 %>% mutate(Fare = round(Fare)) # replace the original Fare
View(titanic_rounded_fare)

# sample_n: You can take a random subsample
titanic_subsample = titanic1 %>% sample_n(5)
View(titanic_subsample)

# Sampling per group
titanic_sub_group = titanic1 %>% group_by(Sex) %>% sample_n(5)
View(titanic_sub_group)

# Challenge 5.5: Advanced Challenge
#
# Calculate the average Survived value for a group of 20
# randomly selected females from each Pclass group.
# Then arrange the classes in descending order.
#
# Hint: Use the dplyr functions arrange() and sample_n(),
# they have similar syntax to other dplyr functions.
# Look at the help!

# Arrange: 
set.seed(10)
titanic_ch55 = titanic1 %>% filter(Sex == "female") %>% 
  group_by(Pclass) %>% sample_n(20) %>% 
  summarise(meanSurv = mean(Survived)) %>% arrange(desc(Pclass))
View(titanic_ch55)

# select(df,a, b)
# ggplot
# data geom + coordinate system => plot

### GGPLOT2
install.packages("ggplot2")
library(ggplot2)

titanic = read.csv("https://goo.gl/4Gqsnz")
titanic1 = na.omit(titanic)

# Plot dots
# aes: as statistics, relatoinship to data, 
ggplot(titanic1, aes(x=Age, y=Fare))+  # only corrdinate system
  geom_point()                        # add data points

# Plot lines
ggplot(titanic1, aes(x=Age, y=Fare))+
  geom_line()                      

# Challenge 6.1
#
# Modify the example so that the figure visualises how fare changes across
# passenger class:
ggplot(titanic1, aes(x=Pclass, y=Fare))+
  geom_point() 

# Challenge 6.2
#
# In the previous examples and challenge we've used
# the aes function to tell the scatterplot geom about
# the x and y locations of each point. Another
# aesthetic property we can modify is the point color.
# Modify the code from the previous challenge to color
# the points by the "Pclass" column.
#
# HINT: transform the Pclass column to a factor using
# the as.factor() function to get discrete colours.

# Sol1
titanic1$Pclass = as.factor(titanic1$Pclass) # make it from continuous variables to discrete ones (levels)
typeof(titanic1$Pclass)
ggplot(titanic1, aes(x=Pclass, y=Fare, color=Pclass)) +
  geom_point() 

# Sol2: just one line
ggplot(titanic1, aes(x=Pclass, y=Fare, color=as.factor(Pclass))) +
  geom_point() 

# Plot lines and points
ggplot(titanic1, aes(x=Age, y=Fare))+
  geom_point(aes(color=as.factor(Pclass)))+
  geom_line()

# Reverse order of layers by changing order of code
# The later one shows in the upper layer
ggplot(titanic1, aes(x=Age, y=Fare))+
  geom_line()+
  geom_point(aes(color=as.factor(Pclass)))

