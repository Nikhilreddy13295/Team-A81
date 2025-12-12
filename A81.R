
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

ggplot(student, aes(x = Walc)) +
  geom_histogram(binwidth = 1, boundary = 0.5) +
  scale_x_continuous(breaks = 1:5) +
  labs(
    title = "Distribution of Weekend Alcohol Consumption (Walc)",
    x = "Walc (1–5)",
    y = "Frequency"
  ) +
  theme_minimal()



print(shapiro.test(student$Walc[student$sex == "Female"]))
print(shapiro.test(student$Walc[student$sex == "Male"]))

tt <- t.test(Walc ~ sex, data = student)   # Welch by default in R
print(tt)

mw <- wilcox.test(Walc ~ sex, data = student, exact = FALSE)
print(mw)
