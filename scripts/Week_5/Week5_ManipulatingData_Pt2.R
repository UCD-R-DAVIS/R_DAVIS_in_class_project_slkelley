#Manipulating Data Pt 2----

##Conditional Statements----
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")

#cond statements are a series of logical conditions that can help you manipulate your data to create new variables
##if a statement is true, then execute x, if it is false, then execute y. 
###sometimes helpful to write out steps that you want to accomplish and classify statements and then reclassify as needed

summary(surveys$hindfoot_length)
#mean 29.29

#So if want to split the data at the mean we use a conditional statement


###ifelse() function----
surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, "small", "big")
head(surveys$hindfoot_cat)
#if didn't summarize data first to find mean: instead of 29.29 put mean(surveys$hindfoot_,length, na.rm = TRUE), yes = "small", no = "big")
unique(surveys$hindfoot_cat)
#"big" NA "small" (helps summarize variables you pulled out)


###case_when() function----
#this function is great when have more than 2 variables that you are working with
#integrates mutate into conditional function
##final condition here should always be TRUE - so combine: when previous conds have not been met, assign the last value

###note that ifelse reports NAs, but casewhen() does not report NAs but instead turns them into the smaller variable so must focus on removing NAs when using casewhen()

surveys %>% 
  mutate(hindfoot_cat = case_when(hindfoot_length > 29.29 ~ "big", TRUE ~ "small")) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head() #shows NAs as small

#so need to adjust and add another condition:
surveys %>% 
  mutate(hindfoot_cat = case_when(hindfoot_length > 29.29 ~ "big", is.na(hindfoot_length) ~ NA_character_, TRUE ~ "small")) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()
#still shows the NA but not assigning to the small category
## TRUE ~ "" is a catchall for everything else that doesn't fit in with the other implied variables you are pulling out of the data frame. (and if always lable this catchall "small")


#Question: How many functions can you apply to the first variable? And why can't you just remove the NAs instead of labeling them as a character and not a variable?


##removed variables by adding # in script. And when remove TRUE get NAs 


###Challenge----
library(tidyverse)
summary(iris$Petal.Length)
iris %>% 
  mutate(petal.length.cat = case_when(Petal.Length <= 1.6 ~ "small", Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium", TRUE ~ "large")) %>% 
  head()

##Joining Two Dataframes----
#joining together two csv filesof data - join() function

##joins by rows by matching column names and joins data together to eliminate redundancy

###so everything in data tables needs an id # to join. 

####use dim() function to check dimensions of all your data before you join/merge(merge only in base R or python and not as user friendly)

tail <- read_csv("data/tail_length.csv")
summary(surveys$record_id)
summary(tail$record_id)
#both above read the same - which allows for easy transfer

#join_type(firsttable, secondtable, by = columntojoinby)

##inner_join() - returns all the rows from Table A that has matching values in Table B, and all the columns from both Table A and B - data gets smaller b/c gets rid of non redundant ids

##left_join() - returns all the rows from Table A with all the columns from both A and B. Rows in Table A that have no match in Table B will return NAs - usually always use this and just flip (x,y) esp cuz removes things from table b that aren't included in table a. 

##right_join() - returns all the rows from Table B and all columns from both A and B. Rows in Table B that have no match in Table A will return NAs

##full_join() - returns all the rows and columns from Table A and Table B. Returns NAs for either no matching values or missing values - the only join that keeps all the data and gives redundancy

###to combine surveys and tails we will do a left_join():
surveys_joined <- left_join(surveys, tail, by = "record_id")
surveys_joined

#instead of selecting certain columns, can remove certain columns like surveys %>% select(-record_id)

#if have columns with same values but different titles, like record_id and record_id2, can merge these like this:  left_join(surveys, tail %>% rename(record_id2 = record_id), by = c('record_id = record_id2))


###Challenge----
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveysNL <- filter(surveys, species_id == "NL")
surveysNL$species_id

tail <- read.csv("data/tail_length.csv")

summary(surveysNL$record_id)

surveysNL_tail_left <-
  left_join(surveysNL, tail, by = "record_id")

surveysNL_tail_right <- 
  left_join(tail, surveysNL, by = "record_id")

nrow(surveysNL_tail_left) #1252
nrow(surveysNL_tail_right) #34786


##Reshaping the Pivot Functions----
#making rows new columns so can compare certain features of one column variables with another

#Turn rows (values) into column names or variables - pivot_wider()
#turn columns (variables) into rows or values - pivot_longer()


###pivot_wider----
#widens data by increasing column numbers and decreasing row numbers. 3 Main Arguments: 1)the data 2) names_from (name of column) 3) values_from (data you want in new columns)
##so if want mean weight for each species in each plot:
library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))

n_distinct(surveys_mz$genus) #10
n_distinct(surveys_mz$plot_id) #24

#want a data frame with 10 rows and 24 columns

wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = "plot_id", values_from = "mean_weight")

wide_survey


###pivot_longer----
#lengthens data by increasing the number of rows and decreasing the number of columns. 4 main arguments: 1)the data 2)cols, the columns to be pivoted or ignored 3)names_to (the game of the new column you will create to put the column names) in 4)values_to (the name of the new column to put the column values in)

surveys_long <- wide_survey %>%
  pivot_longer(col = -genus, names_to = "plot_id", values_to = "mean_weight")

surveys_long #brings back NAs where absent in pivot_wider(), bc they need to match up with each variable here and not in pivot_wider() as they can just get ignored

surveys_long <- surveys_long %>%
  filter(!is.na(mean_weight))
surveys_long


###Challenge----


##Exporting Data----

