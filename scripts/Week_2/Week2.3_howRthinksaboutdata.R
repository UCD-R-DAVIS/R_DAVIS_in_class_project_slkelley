#How R Thinks About Data----


##Vectors----
weight_g <- c(50, 60, 65, 82)
weight_g
animals <- c("mouse", "rat", "dog")
animals


###Inspecting Vectors----
length(weight_g)
length(animals)
class(weight_g)
class(animals)
str(weight_g)
str(animals)
weight_g <- c(weight_g, 90) #adds value to end of vector
weight_g <- c(30, weight_g) #adds value to beginning of vector
weight_g <- c(15, weight_g, 109) #adds value to beginning and end

#QUESTION: How do you remove values in a vector?

doubleatomicvector <- c(12.2, 56.34, 45.6)
class(doubleatomicvector) #numeric
typeof(doubleatomicvector) #double
rm(doubleatomicvector)

#Atomic vectors (linear strings) and are: numeric, character, double, integer(2L), logical (True/False)


###Challenge----
num_char <- c(1, 2, 3, "a")
num_char
class(num_char) #character
num_logical <- c(1, 2, 3, TRUE)
num_logical
class(num_logical) #numeric
char_logical <- c("a","b","c", TRUE)
char_logical
class(char_logical) #character
tricky <- c(1, 2, 3, "4")
tricky
class(tricky) #character

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a","b","c", TRUE)
combined_logical <- c(num_logical, char_logical)
combined_logical #when combined only shows one TRUE b/c num_logical turns the True into a numerical 1 based on class being numerical = coercion
length(combined_logical) #8
class(combined_logical) #character - b/c character trumps numerical

#logical<numerical<character


##Subsetting Vectors----
animals <- c("mouse","rat","dog","cat")
animals[2] #rat - returns the second value in animals
animals[c(3,2)] #dog, rat - returns the (third, second) value in animals
animals[c(1,2,3,2,1,4)]#"mouse" "rat" "dog" "rat" "mouse" "cat" - repeats indeces and adds more. If "animal" not in original vector, will list NA


###Conditional Subsetting----
weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)] #21 39 54 - includes numbers in vector marked TRUE - called a logical vector

weight_g > 50 #FALSE FALSE FALSE TRUE TRUE - says true/false for numbers in vector string that are larger than 50. 

weight_g[weight_g > 50] #54 55 - chooses only the values greater than 50

weight_g[weight_g < 30 | weight_g > 50] #21 54 55 - values where only one condition is true
weight_g[weight_g >= 30 & weight_g == 21] #numeric(0) - values where both conditions are true - answer is none or (0)
animals[animals == "cat" | animals == "rat"] #"rat" "cat" 


####Challenge----
#Question: %in% : Need further explanation on this portion. I don't get it
#Question: Need help on this %in% challenge


##Vector Math & Recycling----
x <- 1:10

x + 3 # 4 5 6 7 8 9 10 11 12 13 (10 numbers kept)

x*10 # 10 20 30 40 50 60 70 80 90 100

#If add two vectors of equal length, R will add vectors together along string :

y <- 100:109

x + y # 101 103 105 107 109 111 113 115 117 119

#if add vectors that aren't same length it will add together by recycling through the shorter vector

z <- 1:2

x + z # 2 4 4 6 6 8 8 10 10 12

#If add a vector like 1:3 that doesn't multiply evenly into another vector, you will get a warning...but it will still recycle through

z <- 1:3

x + z # 2 4 6 5 7 9 8 10 12 11

#if want to see how vectors are being added or multiplied together:

cbind(x, y, x + y)
cbind(x, z, x + z)

#can also recycle with logical vectors and cycles through the same way with uneven vectors:
x[c(TRUE, FALSE)] # 1 2 5 7 9 

x[c(TRUE, FALSE, FALSE)] # 1 4 7 10


##Missing Data----
#missing data in R is noted as NA. When hit enter datasets with NA will show NA as a result

#must type in na.rm=TRUE to ignore these NA values and get actual results from your data

heights <- c(2, 4, 4, NA, 6)
mean(heights) # answer is NA
mean(heights, na.rm = TRUE) # answer is 4 
length(heights) # 5
max(heights) # NA
max(heights, na.rm = TRUE) # 6

#To extract elements out of vector set that aren't missing values (NA) - 3 functions:

is.na(heights) # False False False True False
##returns a logical vector with TRUE where there is an NA

!is.na(heights) #TRUE TRUE TRUE FALSE TRUE
##returns logical vector with False where there is an NA. 
### the ! means "is not"

heights[!is.na(heights)] # 2 4 4 6
##extract numbers in vector that are NOT NA

heights[complete.cases(heights)] # 2 4 4 6
##extract those elements which are complete cases. the returned object is an atomic vector of type "numeric" or "double" 

###Question: A little unsure of above


####Challenge----
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
heights[!is.na(heights)]
median(heights) #NA --so even after remove NAs from previous #1 part of challenge still need to remember to remove
median(heights, na.rm = TRUE)
heights[heights > 67] # 69 NA 68 70 69 NA 72 70
tall_heights <- c(69, NA, 68, 70, 69, NA, 72, 70)
tall_heights[!is.na(tall_heights)] # 69 68 70 69 72 70
median(tall_heights, na.rm = TRUE) # 69.5
mean(tall_heights, na.rm = TRUE) # 69.7

