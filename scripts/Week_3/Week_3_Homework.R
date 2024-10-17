read.csv("data/portal_data_joined.csv")
view(surveys)
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
surveys_base
tail(surveys_base, )
surveys_base <- factor (c("species_id", "plot_type"))
levels(surveys_base)
surveys_base <- surveys_base[!is.na(surveys_base)]


#use factors to take data a step farther by using it with categorical variables. Characters are a type of data that can be turned into a factor, but best to work with factors which are 2D. Factors reduce redundancy in data.

#Factors are great for statistical analysis and large data sets and helpful for data analysis.

#Challenge----
challenge_base <- surveys_base[surveys_base(weight > 150)]

challenge_base <- surveys_base[,weight] > 150]

challenge_base <- surveys_base[surveys_base[,2]>150,]

#revert and make sure weights is included in above since changed only 2 parameters to factors

read.csv("data/portal_data_joined.csv")
view(surveys)
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
surveys_base
?as.factor
as.factor("species_id")
as.factor("plot_type")
levels(surveys_base)
class(surveys_base)
class(surveys_base$species_id)
as.factor(surveys_base$species_id)
class(surveys_base$species_id)
surveys_base$species_id <- factor(surveys_base$species_id)
class(surveys_base$species_id)
surveysread.csv("data/portal_data_joined.csv")
view(surveys)
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
surveys_base$plot_type <- factor(surveys_base$plot_type)
class(surveys_base$plot_type)
levels(surveys_base)
class(surveys_base)

##Challenge----
surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")]
challenge_base <- surveys_base[surveys_base[, "weight"]>150,]
challenge_base

#I looked at the answers given online and couldn't get here on my own after trying different things and looking online and through the tutorial. I spent about 4 Hours on this. I went wrong somewhere, but I'm just not sure where. So I am starting fresh to see where exactly I messed up...

surveys_base <- surveys[1:5000, c(6, 9, 13)]
surveys_base <- surveys_base[complete.cases(surveys_base), ]

surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base$plot_type <- factor(surveys_base$plot_type)
levels(surveys_base$species_id)
#Okay following your steps here I get the answer right. Seems I need to switch around the order in which I did things

challenge_base <- surveys_base[surveys_base[, 2]>150,]
challenge_base
#Still get the NAs in my dataset 
challenge_base <- challenge_base[complete.cases(challenge_base), ]
challenge_base
#Alright I got rid of the NAs and I got an answer with no errors. Whew that took some effort. Understand this a bit better after all this, but still a bit unsure. 