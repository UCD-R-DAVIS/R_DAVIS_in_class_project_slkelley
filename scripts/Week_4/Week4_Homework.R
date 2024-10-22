#1
library(tidyverse)

surveys <- read.csv("data/portal_data_joined.csv")

#2
surveys_hw4 <- surveys %>% 
  filter(!is.na(weight)) %>% 
  filter(weight >= 30 & weight <= 60) %>% print(surveys_hw4 = 6)

print(surveys_hw4, head) #Question: How do I use the print function? Above created no errors like this one, but didnt' just give me 6 functions nor a print page
?print

#3
biggest_critters <- 
  surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  summarize(weight_max = max(weight), weight_min = min(weight)) %>% 
  arrange(weight_max, weight_min)
biggest_critters

#4
surveys %>% 
tally(species_id, sex, weight)

surveys %>%
  group_by(species_id, sex, weight, plot_id) %>%
  tally()

sum(is.na(surveys$weight) |
      is.na(surveys$sex) |
      is.na(surveys$year) |
      is.na(surveys$plot_id))
#so most NAs are in the weight category after comparing these with one another

#5
surveys_avg_weight <- 
  surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(weight_ave = mean(weight)) %>% 
  select(species_id, sex, weight, weight_ave)

surveys_avg_weight
nrow(surveys_avg_weight [c(20:124),])
print(surveys_avg_weight [c(20:124),], n = 105)

rm(num_rows)

#6
surveys_avg_weight %>% 
  group_by(species_id, sex) %>% 
  mutate(above_average = weight > weight_ave)

         