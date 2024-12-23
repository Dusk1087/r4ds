library(tidyverse)
library(nycflights13)

x <- c("1.2", "5.6", "1e6")
y <- parse_double(x)
x1 <- c("$1,234", "USD 3,513", "59%")
z <- parse_number(x1)
z

flights |> count(dest)
flights |> count(dest, sort = TRUE) |> 
  print(n = 50)

flights |> 
  group_by(dest) |> 
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  ) |> 
  arrange(
    desc(n)
  ) |> 
  print(n = Inf)

flights |> 
  group_by(dest) |> 
  summarize(carriers = n_distinct(carrier)) |> 
  arrange(desc(carriers)) |> 
  print(n = Inf)

flights |> 
  group_by(tailnum) |> 
  summarize(miles = sum(distance, na.rm = TRUE)) |> 
  arrange(desc(miles))

flights |> 
  print(n = Inf)
view(flights)

flights <- flights
x <- flights
view(x)
flights
glimpse(x)

flights |> count(tailnum, wt = dep_delay)
flights |> count(tailnum)

flights |> 
  summarize(n_cancelled = sum(is.na(dep_time)))
flights |> 
  group_by(dest) |> 
  summarize(n_cancelled = sum(is.na(dep_time)))

flights |> 
  group_by(dest) |> 
  summarize(n = n()) |> 
  arrange(desc(n))

flights |> count(dest, sort = TRUE)

flights |> count(tailnum, wt = distance)

flights |> 
  group_by(tailnum) |> 
  summarize(
    wt = sum(distance)
  )

x <- c(1, 2, 10, 20)
x / 5
x / c(5, 5, 5, 5)

x * c(1, 2)
x * c(1, 2, 3)

flights |> 
  group_by(month) |> 
  filter(month %in% c(1, 2))

df <- tribble(~x, ~y, 1, 3, 5, 2, 7, NA)
df |> 
  mutate(
    min = pmin(x, y, na.rm = TRUE),
    max = pmax(x, y, na.rm = TRUE)
  )

df |> 
  mutate(
    min = min(x, y, na.rm = TRUE),
    max = max(x, y, na.rm = TRUE)
  )

10 %/% 3
1:10 %/% 3
1:10 %% 3

flights |> 
  mutate(
    hour = sked_dep_time %/% 100,
    