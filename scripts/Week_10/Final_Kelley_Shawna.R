#Final-----
##Shawna Kelley ECL 224

##1----
library(tidyverse)

url <- 'https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv'

tyler_final_activity <- read_csv(url)
view(tyler_final_activity)

##2----
tyler_running <- tyler_activity %>% filter(sport == "running")
view(tyler_running)

##3----
tyler_running <- tyler_running %>% filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>% filter(total_elapsed_time_s > 60)
view(tyler_running)

##4----
installed.packages("Rtools")
install.packages("timetk")

tyler_running <- tyler_running %>% mutate(Run_Periods = case_when(
  timestamp %>% between_time('2024-01-01 00:00:00' , '2024-06-30 00:00:00') ~ 'Initial_Rehab', timestamp %>% 
    between_time('2024-07-01 00:00:00' , '2024-12-12 00:00:00') ~ 'Active_ities', T ~ 'pre_2024'))

library(lubridate)                                          
tyler_running <- tyler_running %>% 
  mutate(Run_Periods = case_when(
    timestamp >= ('2024-01-01 00:00:00') & timestamp <= ('2024-06-30') ~ "Initial_Rehab", timestamp >= ('2024-07-01 00:00:00') & timestamp <= ('2024-12-12 00:00:00') ~ "Active_ities", TRUE ~ "Pre-2024"))

view(tyler_running)

#took a couple tries here. Tried a way above but couldn't download the package for 'between_time' function appropriately, so didn't work. But maybe because soon realized COlumn Timestamp was not in datetime format. Learned this after using lubridate function which really wasn't needed. put in ymd_hms before each time input and got a warning and only got a grouping of pre_2024. Took it out bc realized not a timedate variable and WOOHOO got three groupings that were listed right. -Okay moving on now. 

##5 & 6----
tyler_running_2 <- tyler_running %>% 
  mutate(Speed_by_lap = minutes_per_mile/4)
view(tyler_running_2)

tyler_rungrid <- ggplot(tyler_running_2, aes(x = Speed_by_lap, y = steps_per_minute)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = 'lm', color = 'red', linetype = 'dashed') +
  theme_light() +
  theme(panel.grid = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5)) +
  ggtitle ('Average Steps per Minute') +
  xlab("Speed per Lap(min)") + ylab("SPM(steps)")

ggsave(filename = "tyler_rungrid.png", plot = tyler_rungrid, width = 6, height = 4, units = 'in', dpi = 700)

##7----
#Ran out of time trying to figure out above solutions. 

##Having a hard time getting GIT to see this assignment and this has never happened before. I can't push it to my GIThub account. 
  