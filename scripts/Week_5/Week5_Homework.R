#Week 5 Homework

#1

library(tidyverse)
t_surveys <- read_csv("data/portal_data_joined.csv")

n_distinct(t_surveys$plot_type)#5
n_distinct(t_surveys$genus) #26

surveys_wide <- t_surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(plot_type, genus) %>% 
  summarize(mean_hindfoot_length = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = "plot_type", values_from = "mean_hindfoot_length") %>% arrange(control)

view(surveys_wide)

surveys_wide %>% arrange(Control)
view(surveys_wide)

surveys_wide <- t_surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(plot_type, genus) %>% 
  summarize(mean_hindfoot_length = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = "plot_type" & "genus", values_from = "mean_hindfoot_length") %>% arrange(control)
view(surveys_wide)

#2
summary(t_surveys$weight)

t_surveys$weight_cat <- ifelse(t_surveys$weight <= 20.00, "small", ifelse(t_surveys$weight > 20.00 & t_surveys$weight < 48.00, "medium", "large"))

t_surveys$weight_cat

#ifelse only takes two arguments at a time. So had to work it out to figure out where I went wrong and how to add another function which so happens to be another ifelse statement. The irispetal challenge in the tutorial really helped with this example. NAs dont get categorized which is nice, so they remain out of the equation for future data rendering. 

summary(t_surveys$weight)

t_surveys$weight_cat <- t_surveys %>% 
  mutate(weight_cat = case_when(weight <= 20.00 ~ "small", is.na(weight) ~ NA_character_, weight > 20.00 & weight < 48.00 ~ "medium", TRUE ~ "large"))

view(t_surveys$weight_cat)

#NAs here for case_when() show up in the "large" category, so there must a removal of NAs function so these NAs don't get added to incorrect categories as assumptions. 