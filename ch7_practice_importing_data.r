library(tidyverse)
library(janitor)
students_raw <- read_csv('./data/students.csv', na = c("N/A",""))
view(students_raw)
# students |> 
#   rename(
#     student_id = 'Student ID',
#     full_name = 'Full Name'
#   )
students <- students_raw |> 
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
  )
