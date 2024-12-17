library(tidyverse)

ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()

diamonds |> 
  count(color, cut) |> 
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))


diamonds |> 
  count(color, cut) |> 
  ggplot(aes(x = color, y = n, fill = cut)) +
  geom_point(stat = "identity", position = "fill")

smaller <- diamonds |> 
  filter(carat < 3)

ggplot(smaller, aes(x = carat, y = price)) +
  geom_point(alpha = 1 / 100)

ggplot(smaller, aes(x = carat, y = price)) +
  geom_bin2d()

ggplot(smaller, aes(x = carat, y = price)) +
  geom_hex()

ggplot(smaller, aes(x = color, y = cut)) +
  geom_hex()

ggplot(smaller, aes(x = carat, y = price)) +
  geom_boxplot(aes(group = cut_number(carat, 5)), varwidth = TRUE)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_boxplot(aes(group = cut_number(carat, 20)))  # Equal points


ggplot(smaller, aes(x = carat, y = price)) +
  geom_boxplot(aes(group = carat())
               
ggplot(seals, aes(x = long, y = lat)) +
  geom_hline(aes(yintercept = 2))

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut_number(carat, 2)), binwidth = 500) +
  labs(color = "Carat Size Group")

