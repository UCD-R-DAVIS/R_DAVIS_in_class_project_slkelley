#Intro to R: Arithmetic
3 + 4
4 + 8 * 3 ^ 2
4 + (8 * 3) ^ 2
(4 + 8) * 3 ^ 2

#Mathematical Functions
exp(1)
#inverse
log(4)
sqrt(20)

#r help files
?log
#can put ?log into both Rscript & Console
log(2,4)
log(4,2)
#difference can be found in values of functions due to ?log as = sign is primary function to be used
log(base = 4, x = 2)
#answer matches the above log(2,4) equation
#not a good idea to make variables the same as the variables used in the ?(function)

#Six Comparison Functions
mynumber <- 6
mynumber == 5
#one = sign assigns a variable, so double == means equal to.  <- means equal to as you assign variables as well

#use tab to complete function insertions or look through list of usable functions

mynumber != 5
# != means not equal to
mynumber < 3
mynumber > 3
mynumber >= 3
othernumber <- -3
mynumber * othernumber 

#object name conventions
numsamples <- 50
num_samples  <- 40
#both above are different variables
rm(num_samples)

#lists all objects open in this file
ls()
rm(list = ls())
ls()

#errors & warnings
log("a_word")
#Error: object not found means doesn't exist or not loaded

#ctrl F opens a search bar to find something in your script including errors

#script should be logical to take you from start to finish

#Errors doesn't run script and just stops in R, BUT Warning Messages still run script even though it is probably wrong or just giving you a heads up that something funky is happening

#Challenge

elephant1_kg <- 3492
elephant2_lb <- 7757

elephant1_lb <- elephant1_kg * 2.2

elephant2_lb > elephant1_lb

myelephants <- c(elephant1_lb, elephant2_lb)

which(myelephants == max(myelephants))
