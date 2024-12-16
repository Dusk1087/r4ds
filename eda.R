library(tidyverse)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram()


smaller <- diamonds |> 
  filter (carat < 3) 

smaller |> 
ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = .5)

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = .5) +
  coord_cartesian(ylim = c(0, 40))

ggplot(diamonds, aes(x = price)) +
  geom_histogram(bindwidth = 0.5) +
  ylim(0, 80)

unusual <- diamonds |> 
  filter(y < 1 | y > 20) |> 
  select(price, x, y, z) |> 
  arrange(y)
unusual


