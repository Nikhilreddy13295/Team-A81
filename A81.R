
library(ggplot2)

student <- read.csv("student-mat.csv", sep = ";", stringsAsFactors = FALSE)

if (ncol(student) == 1) {
  student <- read.csv("student-mat.csv", sep = ",", stringsAsFactors = FALSE)
}

cat("Rows:", nrow(student), "Cols:", ncol(student), "\n")
print(names(student))
