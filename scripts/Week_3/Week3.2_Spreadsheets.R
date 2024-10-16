#Spreadsheets----
?read.csv #pulls up info about data input, scroll down and will find the info you are looking for about read.csv proper (csv is your spreadsheet file type)

surveys <- read.csv("data/portal_data_joined.csv")
#other ways to find this...look up if can't find your data file you are looking for by starting with getwd()
nrow(surveys) #34786
ncol(surveys) #13
dim(surveys) #34786 13
str(surveys) #lists your surveys data frame
class(surveys) #data.frame
head(surveys)
tail(surveys)
head(surveys, n = 3) #header that shows first 3 instead of first 6
view(surveys) #how to view the whole survey in a table but can also click on surveys in Environment Tab

colnames(surveys) #returns column names
rownames(surveys) #returns row names
summary(surveys) #plot_type, length: 34786, class: character, mode: character

summary(object = surveys)
summary.data.frame(surveys) #gives class and mode for each row

##Indexing----
#() always are used when specifying and working with functions
#[] are used with variables and vectors to pull data out of 

#head and tails are wrappers for indexing so don't have to keep scrolling up and down to see your code inputs below 

#[[]] are used to get vector out of data frame to manipulate it
#[] will give you the "metadata" of the data frame ie genus and [[]] will give you the data inside of the metadata ie neotoma

# $ ie surveys$genus will pull up what is in the column genus ie neotoma -- can only select one at a time, whereas [[]] works by inputting multiple columns. Doesn't work with rows bc read as metadata and csv files aren't set up with row name values but only column names like a true excel spreadsheet table

install.packages("tidyverse")
library(tidyverse)
#how to install packages you may not have... can also find these in packages in file section of Rstudio

surveys <- read.csv("data/portal_data_joined.csv") #be sure to put this in quotes and use tab to find a drop down list to use

surveys
class(surveys) #data.frame"

#data.frames are just a collections of vectors - every column is a vector with a single data type

install.packages("dplyr")
library(dplyr)
unique_count <- n_distinct(surveys)
print(unique_count)

#Data frames are 2D so specify row vs column: Rows come first then columns
#leaving row space blank will return all rows, and same with columns

surveys[1,1,] # 1 - first element in first column of data frame - as a vector

surveys[1,6] #"NL" - first element in 6th column - as a vector

surveys[,1] #first column of data.frame - as a vector

surveys[1] #first column of data.frame - as a data.frame

surveys[1:3, 7] #"M" "M" "" - first 3 elements in 7th column - as a vector

surveys[3, ] #3rd row of data.frame - as a data.frame

head_surveys <- surveys[1:6, ] #creates numeric vectors of integers in increasing or decreasing order
head_surveys[1:10, ]
head_surveys[10:1, ]

surveys[,-1] #whole data frame, minus the first column

surveys[-c(7:34786),] #same as head(surveys)

#can subset data frames by indices, BUT can also call them by their names directly

surveys["species_id"] #data frame
surveys[, "species_id"] #vector
surveys[["species_id"]] #vector
surveys$species_id #vector
#like this last $ option as it is similar to using tab feature and lists all columns and don't need ""

surveys_200 <- surveys[200, ] #made new data frame that just shows row 200. 
 surveys_200

nrow(surveys)
surveys_last <- surveys[34786, ]
surveys_last

34786/2
surveys_middle <- surveys[17393, ]
surveys_middle


##Tidyverse----

t_surveys <- read_csv("data/portal_data_joined.csv")
t_surveys
class(t_surveys)
##tidyverse prints things out really nice and sums up all of the basic things we already learned in Base R all in one fell swoop
# this nicely laid out data frame is called a "tibble"

#always check whether you get a "tibble" back or a vector

surveys[,1] #vector
#vs
t_surveys[,1] #tibble

