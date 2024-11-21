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

#can also do this = ymd_hm(paste(year, month, day, sep = "-"))
#sep = is meant to be created so if want to put zzzz to ascertain outliers, you can even do that
#paste is a really flexible function that just keeps adding things together as you put them into a paste format

mloa4 = mloa3 %>% 
  mutate(datetimelocal = with_tz(datetime, tz = "Pacific/Honolulu"))

mloa4 %>% 
  group_by(datetimelocal, temp_C_2m) %>% 
  summarize(avehrtemp = mean(hour24, na.rm = TRUE)) %>% 
  ggplot(aes(x = temp_C_2m, y = avehrtemp)) +
  geom_point(aes(color = datetimelocal)) +
  scale_color_viridis_c() +
  theme_bw()

#In class homework discussion: I got the wrong plot at the end part of the problem, so in class I worked on it based off of the answer and found where I went wrong:

mloa4 %>% 
  mutate(localmon = month(datetimelocal, label = TRUE), localhour = hour(datetimelocal)) %>% #this part can also read: mutate(hour_hst = hour(datetime_hst)) %>% group_by(hour_hst, month)
  group_by(localmon, localhour) %>% 
  summarize(meantemp = mean(temp_C_2m)) %>% 
  ggplot(aes(x = localmon, y = meantemp)) +
  geom_point(aes(colour = localhour)) +
  scale_color_viridis_c() +
  xlab("Month") +
  ylab("Mean temperature (degrees C") +
  theme_classic()

#khroma package makes circular color schemes so if you want data at 0 to be similar to the 24 bcuz its a 24 hour clock as an example use this...

