library(tidyverse)
<<<<<<< HEAD
students <- read_csv('./data/students.csv', na = c("N/A", ""))
view(students)

annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)
view(annoying)
annoying$`1`
annoying$`2`

annoying |> 
  ggplot(aes(x = `1`, y = `2`)) +
  geom_point() +
  labs(x = '1', y = '2', title = "Scatterplot")

annoying <- annoying |> 
  mutate(
    `3` = `2` / `1`
  )

annoying |> 
  rename(
    one = `1`,
    two = `2`,
    three = `3`
=======
library(janitor)
library(arrow)
students_raw <- read_csv('./data/students.csv', na = c("N/A",""))
view(students_raw)
# students |> 
#   rename(
#     student_id = 'Student ID',
#     full_name = 'Full Name'
#   )
students_y <- students_raw |> 
  clean_names() 

students

students %>% 
  distinct(meal_plan)

students <- students |> 
  mutate(meal_plan = factor(meal_plan))

students |> 
  distinct(age)

students |> 
  mutate(
    age = parse_number(if_else(age == 'five', '5', age))
>>>>>>> eb1e05fb16bb6bc705e506fa72e354b45a4fe16b
  )

file_name <- 'data/new 1.csv'
view(file_name)

test_file <- list.files("data", pattern = "\\.csv", full.names = TRUE)
view(test_file)

students
students_y

write_csv(students_y, "data/students_yy.csv")
read_csv("students_yy.csv")

write_parquet(students_y, "data/students.parquet")
read_parquet("data/students.parquet")

write_rds(students_y, "data/students_rds.rds")
read_rds("data/students_rds.rds")
