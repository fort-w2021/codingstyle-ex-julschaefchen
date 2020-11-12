### b)

### Group name: Laplace ###

### Practical Exercise 3: flight routes ###

# Assignment 1 ----
# Create a Graeco-Latin square (7x7) with artificial treatment/block expressions
# with the variables treatment (1 = 10% less, 2 = same price, 3 = 10% more),
# time (morning, noon, evening), distance (1,2,3,4) and days 
# (mon, tue, wed, thu, fri, sat, sun)

library(agricolae)
library(tidyverse)

# creating variables
route <- paste("route_", 1:4, sep = "")
time <- c("morning", "noon", "evening")
day <- c("mon", "tue", "wed", "thu", "fri", "sat", "sun")
treatment <- factor(x = c(1, 2, 3, NA, NA, NA, NA))

# Function, that creates a Graeco-Latin square (7x7) for two treatments 
# (treatment1, treatment2)
create_graeco_latin_square <- function(treatment1, treatment2) {
  square <- design.graeco(trt1 = treatment1, trt2 = treatment2, serie = 2)
  print(square[["sketch"]])
}

# Function, that reduces a a Graeco-Latin square (from function
# create_graeco_latin_square),
# for block expressions block1 and block2
reduce_graeco_latin_square <- function(square, block1, block2) {
  reduced_square <- as.data.frame(square[1:seq_len(block1), 1:seq_len(block2)])
  rownames(reduced_square) <- paste(block1)
  colnames(reduced_square) <- paste(block2)
  print(reduced_square)
}

# example: graeco-latin square (7x7)
square_example <- create_graeco_latin_square(treatment1 = day,
                                             treatment2 = treatment)

# example: reduced Graeco-Latin square
# rows/columns with synthetic treatments/ block expressions are missing
reduced_square_example <- reduce_graeco_latin_square(square = square_example,
                                                     block1 = time,
                                                     block2 = route)

# Assignment 2 ----
# Create 12 Graeco-Latin squares (7x7) (one for each week) and 12 corresponding
# reduced Graeco-Latin squares where rows/columns with synthetic treatments/
# block expressions are missing

set.seed(12345)

for (i in 1:12) {
  create_graeco_latin_square(treatment1 = day, treatment2 = treatment) %>%
    reduce_graeco_latin_square(block1 = time, block2 = route)
}


### c) 9: I am quite unhappy with the "graeco_latin_square" - names!
