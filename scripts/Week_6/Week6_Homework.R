#Week 6 Homework----

library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

view(gapminder)

##1----

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_life = mean(lifeExp, na.rm = TRUE)) %>%
  ggplot(data = gapminder, mapping = aes(x = year, y = mean_life, color = continent)) +
  geom_point()

#Answer is a tibble: 60 x 3 w/ columns "Continent" "Year" "Mean_Life"  & each continent has a horizontal straight line across the years for the average when x = year and y = continent and vertical line for the opposite x and y parameters. Tried again with y = mean_life and mean_life doesn't exist with an error code

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_life = mean(lifeExp, na.rm = TRUE)) %>%  ggplot() + geom_point(aes(x = year, y = mean_life, group = continent)) + facet_wrap(~continent)

#Question: why does this work in the geom_() function and not in the ggplot() function??


##2---- 

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

#scale_x_log10() is changing the year by a scale of log10 instead of by each individual year as it was before. This is seen on the x axis.

##geom_smooth() is finding the average path or path of least resistance through the data since there are a lot of points all over the place. So it is creating a smooth dashed black line through the points that were created earlier and because it is second in the function, it will sit on top of the points. 

##3.----

Some_countries <- pivot_wider(gapminder, cols = c(Brazil, China, El Salvador, Niger, United States)) #hmm this wont work, bcuz it will take all rows in a continent. So use google search and found creating a new vector of continents to use and even can create new values vectors to use and put the new vectors together.... Okay let's try this again...

countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")
#tried a google search option that didn't work in creating a vector, went back into tutorial and created a vector from scratch and will add in to ggplot function...?

ggplot(data = gapminder, mapping = aes(x = countries, y = lifeExp)) +
  geom_boxplot() +
  geom_jitter()+ ggtitle("life expectancy of five countries")+
  xlab("country") + ylab("life expectancy")

#Caused by error in `check_aesthetics()`:
! Aesthetics must be either length 1 or
the same as the data (1704).
✖ Fix the following mappings: `x`.
Run `rlang::last_trace()` to see where the error occurred.
> 
#I keep getting an error so I looked at the answer and it says to filter. I don't understand this part. 

#the rest of the labeling part I had to look up on google:

+ ggtitle("life expectancy of five countries")+
  xlab("country") + ylab("life expectancy")
