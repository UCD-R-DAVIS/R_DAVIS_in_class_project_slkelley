#Other Data Structures----


##Lists----
c(4, 6, "dog")
a <- list(4, 6, "dog")#trash bag of storing data in r
#lists are most fundamental way that R works with multiple vectors
##really flexible, various shapes and sizes holding many different variables in one list

class(a) #list


##Data Frames----
#Most common way to work with tabular data

letters # gives a to z letters as variables

data.frame(letters)
df <- data.frame(letters)
t(df)
#also can use:
as.data.frame(t(df))
#but this as.data.frame can get messy when dealing with matrices

length(df) #1
dim(df) #26 1 (rows, columns)
nrow(df) #26
ncol(df) #1

?dim #remember to use this ? function to understand how a variable/function is used in R


##Matrices/Arrays----
#Matrices are 2D
#Arrays are 3D
#Make sure to always check strings and work b/c R really reads this data in different ways. So specify here ALWAYS!
##must be made of single type of data
#can mix in data frames and lists but not in matrices/arrays


##Factors----
#look a lot like 1D character vectors, but behave differently
#used to represent categorical data

animals <- factor(c("duck", "duck", "goose", "goose"))
animals #duck duck goose goose Levels: duck goose
class(animals) #factor
levels(animals) #duck #goose
nlevels(animals) #2

animals <- factor(x = animals, levels = c("goose", "pigs", "duck"))
animals
animals <- factor(x = animals, levels = c("pigs", "duck", "bobcat", "goose"))
animals

year <- factor(c(1978, 1980, 1934, 1979))
year
class(year) #factor
as.numeric(year) #2 4 1 3 
?as.numeric
as.numeric(animals) #2 2 4 4
as.character(animals) #duck duck goose goose
as.character(year) #"1978" "1980" "1934" "1979"

#finish tutorial here and finish 2nd half of video
sex <- factor(c("male", "female", "female", "male"))
class(sex) #factor
typeof(sex) #integer -- factors 

