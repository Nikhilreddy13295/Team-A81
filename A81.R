
library(ggplot2)

student <- read.csv("student-mat.csv", sep = ";", stringsAsFactors = FALSE)

if (ncol(student) == 1) {
  student <- read.csv("student-mat.csv", sep = ",", stringsAsFactors = FALSE)
}

cat("Rows:", nrow(student), "Cols:", ncol(student), "\n")
print(names(student))

student$sex  <- factor(student$sex, levels = c("F","M"), labels = c("Female","Male"))
student$Walc <- as.numeric(student$Walc)

print(aggregate(Walc ~ sex, data = student, FUN = mean))
print(aggregate(Walc ~ sex, data = student, FUN = sd))
print(table(student$sex))

ggplot(student, aes(x = sex, y = Walc, fill = sex)) +
  geom_boxplot() +
  labs(
    title = "Weekend Alcohol Consumption (Walc) by Gender",
    x = "Gender",
    y = "Weekend Alcohol Consumption (Walc: 1–5)"
  ) +
  theme_minimal()
