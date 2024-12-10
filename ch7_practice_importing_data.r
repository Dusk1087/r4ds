library(tidyverse)
students <- read_csv('./data/students.csv', na = c("N/A", ""))
view(students)
