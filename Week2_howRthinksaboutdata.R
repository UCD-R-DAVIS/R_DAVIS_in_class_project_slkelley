#How R Thinks About Data----

##Vectors----
weight_g <- c(50, 60, 65, 82)
animals <- c("mouse", "rat", "dog")

###Inspecting Vectors----
length(weight_g)
str(weight_g)
length(animals)
class(weight_g)
class(animals)
str(animals)
weight_g <- c(weight_g, 90)
weight_g <- c(30, weight_g)
weight_g

###Challenge----
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a","b","c", TRUE)
tricky <- c(1, 2, 3, "4")

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a","b","c", TRUE)
combined_logical <- c(num_logical, char_logical)

##Subsetting Vectors----
animals <- c("mouse","rat","dog","cat")
animals[2]#return the second value in animals
animals[c(3,2)]#return the (third, second) value in animals
animals[c(1,2,3,2,1,4)]#returns this order of values in animals
#Finish this tutorial HERE... So understand better...but first watch videos