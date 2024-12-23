library(tidyverse)
library(nycflights13)

x <- c(1, 2, 3, 5, 7, 11, 13)
x * 2

df <- tibble(x)
df |> mutate(
  y = x *2
)

flights |> 
  filter(
    dep_time > 0600 & dep_time < 2000 & abs(arr_delay) < 20
  )

flights |> 
  mutate(
    daytime = dep_time > 0600 & dep_time < 2000,
    arrival_time = abs(arr_delay) < 20,
    .keep = "used"
  )

flights |> 
  mutate(
    daytime = dep_time > 0600 & dep_time < 2000,
    arrival_time = abs(arr_delay) < 20,
  ) |> 
  filter(daytime & arrival_time)

xx <- c(1 / 49 * 49, sqrt(2) ^ 2)
xx 
xx == c(1, 2)
print(xx, digits = 16)

near(xx, c(1 , 2))

flights |> 
  filter(dep_time == NA)

flights |> 
  filter(is.na(dep_time))

flights |> 
  filter(month == 1, day == 1) |> 
  arrange(dep_time)

flights |> 
  filter(month == 1, day == 1) |> 
  arrange(desc(is.na(dep_time)), dep_time)

dff <- tibble(x = c(TRUE, FALSE, NA))

dff |> mutate(
  and = x & NA,
  or = x | NA
)

flights |> 
  filter(month == 11 | month == 12)

1:12 %in% c(1, 5, 8)

flights |> 
  filter(month %in% c(11, 12))

flights |> 
  filter(dep_time %in% c(NA, 0800))

flights |> 
  group_by(year, month, day) |> 
  summarize(
    all_delayed = all(dep_delay <= 60, na.rm = TRUE),
    any_long_delay = any(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )

flights |> 
  group_by(year, month, day) |> 
  summarize(
    proportion_delayed = mean(dep_delay <= 60, na.rm = TRUE),
    count_long_delay = sum(arr_delay >= 300, na.rm = TRUE),
    .groups = "drop"
  )

flights |> 
  filter(arr_delay > 0) |> 
  group_by(year, month, day) |> 
  summarize(
    behind = mean(arr_delay),
    n = n(),
    .groups = "drop"
  )

flights |> 
  group_by(year, month, day) |> 
  summarize(
    behind = mean(arr_delay[arr_delay > 0], na.rm = TRUE),
    ahead = mean(arr_delay[arr_delay < 0], na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

mtcars |> 
  summarize(mean = mean(mpg))

mtcars |> 
  group_by(cyl) |> 
  summarize(mean = mean(mpg))

b <- c(-3:3, NA)
b
if_else(b > 0, "+ve", "-ve", missing = "???")
if_else(b < 0, -b, b)
x1 <- c(NA, 1, 2, NA)
y1 <- c(3, NA, 4, 6)
if_else(is.na(x1), y1, x1)
coalesce(x1, y1)

case_when(
  b == 0 ~ "0",
  b < 0  ~ "-ve",
  b > 0  ~ "+ve",
  is.na(b) ~ "???"
)

starwars |> 
  mutate(type = case_when(
    height > 200 | mass > 200 ~ "large",
    species == "Droid" ~ "robot",
    TRUE ~ "other"
  ),
  .keep = "used"
    )

case_when(
  b < 0 ~ "-ve",
  b > 0 ~ "+ve",
  .default = "????"
)

flights |> 
  mutate(
    status = case_when(
      is.na(arr_delay)   ~ "cancelled",
      arr_delay < -30    ~ "very early",
      arr_delay < -15    ~ "early",
      abs(arr_delay) <= 15 ~ "on time",
      arr_delay < 60     ~ "late",
      arr_delay < Inf    ~ "very late",
    ),
    .keep = "used"
  )
