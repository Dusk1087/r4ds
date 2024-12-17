library(tidyverse)

diamonds <- diamonds

diamonds |> 
  ggplot()

distinct(diamonds, color)

diamonds |> 
plot_build <- ggplot(aes(x = price)) +
  geom_freqpoly(aes(color = cut))

diamonds |> 
  ggplot(aes(x = price, y = after_stat(density))) +
  geom_freqpoly(aes(color = cut), binwidth = 500)

ggplot(diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

mpg <- mpg

distinct(mpg, class)

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) +
  geom_lv()

library(lvplot)
ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) +
  geom_lv()

ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) +
  geom_boxplot()

ggplot(diamonds, mapping = aes(x = cut, y = price)) +
  geom_lv()

ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()
