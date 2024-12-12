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

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(shape = 24, fill = "pink")

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color = displ))

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy), color = "blue")

mpg |> 
ggplot(aes(x = displ, y = hwy, color = (displ < 5))) + 
  geom_point()

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_smooth()

mpg |> 
  ggplot(aes(x = displ, y = hwy, shape = drv)) +
  geom_smooth()

mpg |> 
  ggplot(aes(x = displ, y = hwy, linetype = drv)) +
  geom_smooth()

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv, linetype = drv)) +
  geom_point() +
  geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(shape = class)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)


library(tidyverse)
library(ggrepel)

label_info <- mpg |>
  group_by(drv) |>
  arrange(desc(displ)) |>
  slice_head(n = 1) |>
  mutate(
    drive_type = case_when(
      drv == "f" ~ "front-wheel drive",
      drv == "r" ~ "rear-wheel drive",
      drv == "4" ~ "4-wheel drive"
    )
  ) |>
  select(displ, hwy, drv, drive_type)

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_label_repel(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, nudge_y = 2
  ) +
  theme(legend.position = "none")
