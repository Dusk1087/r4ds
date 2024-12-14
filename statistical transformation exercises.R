library(tidyverse)

ggplot(diamonds, mapping = aes(x = cut)) +
  geom_bar()

diamonds <- diamonds
