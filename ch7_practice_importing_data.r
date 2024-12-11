library(tidyverse)
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
  )
