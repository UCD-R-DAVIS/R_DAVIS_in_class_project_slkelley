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
head(surveys, n = 3) #header that species instead of first 6, only want first 3

summary(object = surveys)
summary.data.frame(surveys) #gives class and mode for each row

##Indexing----
#go over tutorial and videos here for this part...
#() always are used when specifying and working with functions
#[] are used with variables and vectors to pull data out of 

#head and tails are wrappers for indexing so don't have to keep scrolling up and down to see your code inputs below 

#[[]] are used to get vector out of data frame to manipulate it
#[] will give you the "metadata" of the data frame ie genus and [[]] will give you the data inside of the metadata ie neotoma

# $ ie surveys$genus will pull up what is in the column genus ie neotoma -- can only select one at a time, whereas [[]] works by inputting multiple columns. Doesn't work with rows bc read as metadata and csv files aren't set up with row name values but only column names like a true excel spreadsheet table

install.packages("tidyverse")
library(tidyverse)
#how to install packages you may not have... can also find these in packages in file section of Rstudio


