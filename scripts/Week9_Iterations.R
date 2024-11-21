#Iterations----
#are a way to copy and paste but with 100-1 million items of code. Copy/paste tends to get too messy and complicated

##ForLoops----
#: row number, value --> will repeat some bit of code each time with a new input value. 

#Basic Structure:
for(i in 1:10) {print(i)}

for(i in 1:10) {
  print(i)
  print(i^2)
  }

#forloops store values that are put into them

#i value can index a vector or dataframe:

for(i in 1:10){
  print(letters[i])
  print(mtcars$wt[i])
}

#dataframe example:
library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
for(i in unique(gapminder$country)){
  country_df <-gapminder[gapminder$country == i, ]
  df <- country_df %>% 
    summarize(meanGDP = mean(gdppercap, na.rm = TRUE))
  print(df)
}

#to store your results somewhere, create an empty object to hold them before you run the loop:
#also seq_along creates a sequence that is the proper length instead of explicitly writing out 1:10 as an example

results <- rep(NA, nrow(mtcars))

for(i in seq_along(mtcars$wt)){
  results[i] <- mtcars$wt[i]*1000
}
results
#must run for(i) then results second or else just get all NAs

##PURRR----



###map----


###map2----


#can use any iteration letter for code EX: for(f in gz_files){print(f)} --- just need to be consistent

#instead of rbind (for pasting/stacking together rows) function on a whole bunch of rows:
#do.call(rbind, list_of_lap_dataframes)
#length(list_of_lap_dataframes)

#if need to stack a bunch of columns cbind.

#for(file in list_of_lap_dataframes){
#temp <- rbind(temp, file) 
##similar to the do.call function but slightly different??

#split.apply.combine - generic structure of what you should be doing

#sapply(seq_along(state.abb), ....)??

