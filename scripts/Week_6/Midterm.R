#Midterm----
##Taken on 10.30.24 at 1300-1400. 

##1----

library(tidyverse)
url <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'

tyler_activity <- read_csv(url)
view(tyler_activity)

##2----

tyler_running <- tyler_activity %>% filter(sport == "running")
view(tyler_running)

##3----

tyler_running <- tyler_running %>% filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>% filter(total_elapsed_time_s > 60)
view(tyler_running)

##4----

tyler_running <- tyler_running %>% 
  mutate(pace = case_when(minutes_per_mile < 6 ~ "fast", minutes_per_mile > 6 & minutes_per_mile < 8 ~ "medium", TRUE ~ "slow")) %>% 
  mutate(form = case_when(year == 2024 ~ "new", TRUE ~ "old"))
view(tyler_running)

##5----
##stopped here after getting tripped up on how to solve for steps_per_minute averages and use the pivot function

tyler_running_steps <- tyler_running %>% 
  pivot_wider(names_from = "form", values_from = "steps_per_minute") %>% 
  pivot_wider(names_from = "pace", values_from = "steps_per_minute") %>% 
  group_by("pace", "form") %>% 
  summarize(ave_steps = ave(steps_per_minute)) %>% 
  select(pace, form)
view(tyler_running_steps)

##6----

