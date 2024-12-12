library(tidyverse)
mpg
mpg |> 
  ggplot(aes(x = displ, y = hwy, color = class)) +
  geom_point()

mpg |> 
  ggplot(aes(x = displ, y = hwy, shape = class)) +
  geom_point()

mpg |> 
  ggplot(aes(x = displ, y = hwy, size = class)) +
  geom_point()

mpg |> 
  ggplot(aes(x = displ, y = hwy, alpha = class)) +
  geom_point()

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(color = "blue", shape = 25)
