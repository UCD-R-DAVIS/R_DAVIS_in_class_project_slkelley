#Manipulating Data Pt 1----


##dplyr----
#dplyr is a package that makes tabular data manipulation easier

#dplyr works well with tidyr and provides tools for most common data manipulation tasks - written in a compiled language (C++)

#tidyr allows swift conversion between different data formats for plotting and analysis

library("tidyverse") #always need to load the package that you want to use in the moment

surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

#tbl_df shows up here = tibble
#tibble = data frame similar to Base R but has better summary of info
##columns of class "character" are never auto converted into factors like in base R.

#Most Common dplyr functions:  select(), filter(), mutate(), group_by(), summarize(), join()


###Select & Filter----
select(surveys, plot_id, species_id, weight) #for specific columns

filter(surveys, year == 1995) #for specific rows
filter(surveys, year %in% c(1981:1983)) #filtering by range
#use the %in% as a bucket search, if do filter(surveys, year == C(1981, 1982, 1983)) - you are recycling through each of those years per row so get 1/4 of the results
##for above don't need the c(), can just put 1981:1983 after %in%

#if need to actually recycle, explain that in your code when you run it since you do it so infrequently you will know the difference and what is going on here


####Filtering by Multiple Conditions----
#filter(surveys, hindfoot_length > 40 & !is.na(weight)) - An Example

# & - and makes more strict by creating a narrower set of results, | - or creates a less strict and has a wider range of results

#select for columns
#filter for rows

##if want to use both at same time: 1)intermediate steps 2)nested functions OR 3) PIPES!!


#####intermediate steps----
surveys2 <- filter(surveys, weight < 5)
surveys_sml <- select(surveys2, species_id, sex, weight)


#####nested functions----
surveys_sml <- select(filter(surveys, weight < 5), species_id, sex, weight)
##R evaluates expressions like this from INSIDE to OUT -- so our example is from FILTER to SELECT(ie ROWS to COLUMNS)


#####Pipes----
##ctrl + SHift + M - reads first then second (left to right)
###only exists in tidyverse

surveys %>% filter(weight < 5) %>% select(species_id, sex, weight)

#since read left to right, if already filtered a variable, can do this:
#surveys_sml <- filter(weight < 5) %>% select(record_id, plot_id, species_id) Or use above that is simplified to understand the latter.

surveys_sml <- surveys %>% filter(weight < 5) %>% select(species_id, sex, weight)

surveys_sml

surveys
surveys_challenge <- surveys %>% filter (year < 1995) %>% select(year, sex, weight)
surveys_challenge

#can split code in pipes or anything to break it up and add #remarks - do it after [ or ( bc R knows there should be something following that bracket or parenthesis... same with any function - R knows you want something after function

mini <- surveys[190:209,]
table(mini$species_id)

test <- mini %>% filter(species_id %in% c("DM", "NL"))
nrow(test)


###Mutate----
#create a new column with new variables ie a new column of weight in kg

surveys %>% mutate(weight_kg = weight/1000)

#to create a second column off of this new column values

surveys %>% mutate(weight_kg = weight/1000, weight_kg2 = weight_kg * 2)
#this answer has NAs, so to remove add a filter

surveys %>% filter(!is.na(weight)) %>% mutate(weight_kg = weight/1000) %>% head()
#head() only shows the first 6 remember? Just have to add it into the equation, unless you are making a new data.frame (then can just head(new data frame) individually


####Challenge----

library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
surveys

hindfoot_half <- surveys %>% filter(!is.na(hindfoot_length)) %>% mutate(hindfoot_half = hindfoot_length/2)%>%select(species_id, hindfoot_half)
hindfoot_half
hindfoot_half <- hindfoot_half %>% filter(hindfoot_half < 30)
hindfoot_half
tail(hindfoot_half)

###Group By & Summarize----
#split-apply-combine -> split data into groups, apply analysis, combine results (group_by() function)

#calculate summary statistics: like mean weight
surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#tbl_df vs data frame is info in table doesn't run off the screen. neatly contained.

#group by multiple columns
surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#NaN are given first, so to remove:
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight))

#if want to print:name the above something or add %>% print(n=15) or any n = to # of rows you want

##Can summarize multiple variables:
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight), min_weight = min(weight))


####Challenge----

rm(heavyweight_a)
rm(weight_kg)

surveys %>% 
  filter(!is.na(weight)) %>% 
  select
  group_by(year) %>% 
    arrange() #wrong --need to create a summary and then mutate with parameters all in one, don't create new variables bcuz turns them into functions and can't group_by(functions) - so why above I have 2 rm() functions created bcuz I originally created new variables
  
#1.  
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  summarize(max_weight_g = max(weight)) %>% 
  mutate(max_weight_kg = max_weight_g/1000) %>% 
  arrange()
  
#2.
surveys %>% 
  group_by(sex) %>% 
  count()
#OR
surveys %>% 
  group_by(sex) %>% 
  summarize(n = n())