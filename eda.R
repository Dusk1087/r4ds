library(tidyverse)
library(nycflights13)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram()


smaller <- diamonds |> 
  filter (carat < 3) 

smaller |> 
ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 2000)

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 10) +
  coord_cartesian(ylim = c(0, 80))

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 90) +
  ylim(0, 80)

unusual <- diamonds |> 
  filter(y < 1 | y > 20) |> 
  select(price, x, y, z) |> 
  arrange(y)
unusual


carat_selection <- diamonds |> 
  filter (carat == 0.99)
carat_selection

diamonds2 <- diamonds |> 
  mutate(y = if_else(y < 3 | y > 20, NA, y))

diamonds2 |> 
  ggplot(aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)

flights |> 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + (sched_min / 60)
  ) |> 
  ggplot(aes(x = sched_dep_time)) +
  geom_freqpoly(aes(color = cancelled), binwidth = 1/4) +
  facet_wrap(~ cancelled, scales = "free_y")

