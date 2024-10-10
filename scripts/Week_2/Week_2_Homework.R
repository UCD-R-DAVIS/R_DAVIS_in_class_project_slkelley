#Week 2 Homework----
set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
hw2[!is.na(hw2)]
prob1 <- hw2[!is.na(hw2)]
prob1 <- prob1[prob1 >= 14 & prob1 <= 38] #put it ALL together: prob1 <- hw2[!is.na(hw2) & hw2 >= 14 & hw2 <= 38]

prob1
times3 <- prob1 * 3
times3
plus10 <- times3 + 10
plus10
plus10 <- plus10[c(TRUE, FALSE)]
plus10
final <- plus10
final
#[1] 105.09174  57.04763  92.25447
#[4]  83.74723 100.07297  87.73902
#[7]  57.43049  92.76726  93.19901
#[10]  85.12543  69.44137  67.57845