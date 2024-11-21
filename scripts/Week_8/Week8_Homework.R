library(tidyverse)

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa

view(mloa)

# The Mauna Loa data is in UTC Time Zone and any missing values are denoted by a -9, -99 or -999. 

library(lubridate)

mloa2 = mloa %>% 
  filter(rel_humid != -99) %>% 
  filter(temp_C_2m != -999.9) %>% 
  filter(windSpeed_m_s != -999.9)

mloa3 = mloa2 %>% 
  mutate(datetime = ymd_hm(paste0(year, "-", month, "-", day, " ", hour24, ":", min), tz = "UTC"))

mloa4 = mloa3 %>% 
  mutate(datetimelocal = with_tz(datetime, tz = "Pacific/Honolulu"))

mloa4 %>% 
  group_by(datetimelocal, temp_C_2m) %>% 
  summarize(avehrtemp = mean(hour24, na.rm = TRUE)) %>% 
  ggplot(aes(x = temp_C_2m, y = avehrtemp)) +
  geom_point(aes(color = datetimelocal)) +
  scale_color_viridis_c() +
  theme_bw()
