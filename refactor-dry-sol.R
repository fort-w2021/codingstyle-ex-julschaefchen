set.seed(12345)

for (i in 1:3) {
  assign(paste("random_normals", i, sep = ""), rnorm(100))
}

random_normals3_squared <- random_normals3^2

# Function that calculates a confidence interval
calculate_ci <- function(data) {
  mean <- mean(data)
  half_width <- 1.96 * sd(data) / sqrt(length(data))
  
  c(mean - half_width, mean + half_width)
}

lapply(list(random_normals1, random_normals2, random_normals3,
            random_normals3_squared), calculate_ci)



