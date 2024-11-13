library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

view(gapminder)

#create new data.frame with only country, years 2002 & 2007, population
gapminder_2 <- gapminder %>% 
  filter(year %in% 2002:2007) %>% 
  select(continent, country, year, pop)

view(gapminder_2)#looks good

#create two new columns with 2002 and 2007 instead of year

##tried mutate, didn't work
#gapminder_3 <- gapminder_2 %>%  mutate(2002 = year == 2002, 2007 = year == 2007) %>%  select(country, 2002, 2007, pop)

gapminder_3 <- gapminder_2 %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(pop_dif = `2007` - `2002`) %>% 
  select(continent, country, pop_dif) %>% 
  filter(continent %in% c("Asia", "Africa", "Americas", "Europe"))

view(gapminder_3)#looks good
gapminder_3

#creating a plot with data.
##Error occurred in 1st layer, can only have x or y aesthetic? Removed one y and still same error --this was used with geom_bar. Used geom_boxplot and got a graph but not what I wanted. Back to the drawingboard.
#ggplot(gapminder_3, aes(x = country, y = pop_dif)) +
  #geom_boxplot()

#Making a new column with the difference between 2002 & 2007. Copied and pasted into earlier gapminder plot so it would stick for future endeavors. Learned `` function creates variables out of a column dataset to be evaluated. This took awhile. Google did not give this answer easily. 
gapminder_3 %>% 
  mutate(pop_dif = `2007` - `2002`) %>% 
  select(continent, country, pop_dif)

view(gapminder_3)#Worked!

#Filter for only 4 continents:
gapminder_3 %>% 
  filter(continent %in% c("Asia", "Africa", "Americas", "Europe"))

#Now to plot that everything has been done to the data:
gapminder_4 <- ggplot(gapminder_3, aes(x = country, y = pop_dif))+
  geom_col(aes(color = continent, fill = continent))+
  facet_wrap(~continent, scales = 'free')+
  scale_x_discrete()+
  scale_fill_viridis_d(option = "B")+
  theme_bw()+
  theme(panel.grid = element_line())+
  theme(axis.text.x = element_text(angle=45, hjust=1), legend.position = "none")+
  xlab("country") + ylab("Change in Population Between 2002 and 2007")

ggsave("figures/gridplot.png", gapminder_4,)

#Had a hard time saving this to the right size needed. Would love to come to office hours and figure out this step more in depth. 
  
#google search I thought scale_x_discrete could change x axis into ascending order, but couldn't figure out. Took over an hour to figure out. Soooo....gave up and hopefully will see multiple ways when go over homework. 


#Shields 360 Library DataLab Classroom 10-12 on Thurs to meet up next week.
