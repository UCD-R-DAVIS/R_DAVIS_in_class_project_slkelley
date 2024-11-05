#Data Visualization Pt 1----


##GGPLOT2----

#Grammer of Graphic Plotting Package

#with ggplot2 - pretty layout for publication purposes, when make changes to dataset transfers over nicely
##ggplot2 - graphics are built step by step by adding new elements. Extends level of flexibility and customization within plots.

library(tidyverse)

#using a period within a pipe - function runs on whole dataset

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

#basic template:
##ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION>()

ggplot(data = surveys_complete)

#aes = aesthetic function = variables to be plotted and specify how to present them

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

#geoms - graphical representations of the data in plots (ex. points, lines, bars) - many types. 
##Main ones:
###geom_point() = scatter plots, dot plots, etc. 
###geom_boxplot() = boxplots
###geom_line() = trend lines, time series, etc.

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

#anything you add into the ggplot() function can be seen by and + geom() functions. 

# the + sign needs to be added after every new layer addition t be included in the plot or wont be added

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point(aes(color = genus)) +
  geom_smooth(aes(color = genus))

#can also do a universal aes for color by putting it in ggplot() function instead of geom() function.

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length, color = genus)) + geom_point() + geom_smooth()

#size, color and alpha of points can be added
#alpha = transparency of points


###Challenge----
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight, color = genus)) + geom_point(aes(color = plot_type))
#Creates scatterplot which has a lot of lines and points and groups well but a lot of information in each line. best way to visualize this data is through a boxplot.


##Boxplots----

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight, color = genus)) + geom_boxplot()

#geom_jitter() - almost like geom_point, but adds small amount of random variation to the location of each point which allows to visualize density of each point

##if want different geom type out of multiple to be more clearly represented, switch the order they are applied. so put geom_jitter() + geom_boxplot() or vice versa

##if want to switch category order of plotted items = turn plot into factor:
#surveys_reorder$weight <- factor(surveys_reorder$weight, c("small", "medium", "large"))


###Challenge----


##Plotting Time Series Data----

#Time series data can be visualized as a line plot with time on the x axis and counts on the y axis

yearly_counts <- surveys_complete %>% 
  count(year, species_id)
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) + geom_line()

#n = count 

#if have multiple species and don't specify in ggplot, all species for example will get added together in one line. 

#use the group() function after x,y additions: (similar to using color function - ie both specify differences)

##ggplot(data = data.frame, mapping = aes(x = time, y = n, group = )) or y = n, color = ))


##Faceting----

#splits one plot into multiple plots based on a factor included in the dataset.

#This can help with the above species example and create a time series plot for each species:

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~species_id)

#facet_wrap has more settings to add to create even prettier graphs
#Change row or column numbers(nrow)(ncol)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~species_id, nrow = 4)

#can also adjust the facet_wrap() scale (scale) -- there are 4 types:
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~species_id, scales = "free")


###Challenge----




##GGPLOT2 Themes----
#download library(ggthemes) for new themes to use -- cool! 



###Challenge1----



###Challenge2----



##Maps----
#load library(tigris)usgeodatabase & (sf) our sf county data
#color is for lines and fill is like color but for interior value or shape color. 