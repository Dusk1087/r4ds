library(tidyverse)
map_data("nz")
nz <- map_data("nz")

nz |> 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

nz |> 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = clarity, fill = clarity),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1)

bar + coord_flip()
bar + coord_polar()

mpg <- mpg

mpg |> 
  ggplot(aes(x = fl, fill = drv)) +
  geom_bar(position = "stack") + 
  scale_fill_brewer(palette = "Blues") +
  theme_minimal(
    
  )

  