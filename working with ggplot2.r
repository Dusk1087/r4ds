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


# Working at starbucks on 12/13 at 7:43 -----------------------------------

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(aes(linetype = drv))

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth()

mpg |> 
  ggplot(aes(x = displ, y = hwy, color = drv)) +
  geom_point() 


mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(aes(linetype = drv))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth()

# Middle
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(group = drv))

# Right
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)


# Working at home now 12/13 at 8:58 ---------------------------------------

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(
    data = mpg |> filter(class == "2seater"),
    color = "red"
  ) +
  geom_point(
    data = mpg |>  filter(class == "2seater"),
    shape = 1,
    size = 10,
    color = "red"
  )

# geom examples -----------------------------------------------------------

mpg |> 
  ggplot(aes(x = hwy)) + 
  geom_histogram(binwidth = 2)

mpg |> 
  ggplot(aes(x = hwy)) +
  geom_density()

mpg |> 
  ggplot(aes(x = hwy)) +
  geom_boxplot()


# exploring the ggplot2 gallery / using library ggridges ------------------

library(ggridges)
mpg |> 
  ggplot(aes(hwy, drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE) +
  geom_point()

library(ggplot2)
set.seed(123)  # For reproducibility


mpg |> 
  ggplot(aes(cty, hwy)) +
  geom_point() +
  facet_grid(col(fl))

glimpse(mpg)
mpg |> 
  distinct(fl)

mpg |> 
  ggplot(aes(hwy, drv)) +
  geom_point()


# Picking this back up again 12/13 2:29pm ---------------------------------

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_line()  

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_area()  
mpg |> 
  ggplot(aes(x = fl, y = hwy)) +
  geom_boxplot()  

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), level = .2)

mpg |> 
  distinct(drv)


# 9.3.1 Exercise question 4 -----------------------------------------------

mpg |> 
  ggplot(aes(displ, hwy), ) +
  geom_point(size = 5) +
  geom_smooth(linewidth = 2, se = FALSE)

mpg |> 
  ggplot(aes(displ, hwy), ) +
  geom_point(size = 5) +
  geom_smooth(aes(group = drv), linewidth = 2, se = FALSE)

mpg |> 
  ggplot(aes(displ, hwy, color = drv), ) +
  geom_point(size = 5) +
  geom_smooth(aes(group = drv), linewidth = 2, se = FALSE)

mpg |> 
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = drv), size = 5) +
  geom_smooth( linewidth = 2, se = FALSE)

mpg |> 
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = drv), size = 5) +
  geom_smooth(aes(linetype = drv), linewidth = 2, se = FALSE)

mpg |> 
  ggplot(aes(displ, hwy)) +
  geom_point(shape = 16, size = 10, alpha = .5, color = "white") +
  geom_point(aes(color = drv), size = 5) 


# 12/13 at 17:51 ----------------------------------------------------------

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~cyl)

mpg |> 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl, scales = "free")

mpg |> 
  distinct(drv, cyl)

mpg |> 
  ggplot() + 
  geom_point(aes(x = drv, y = cyl))

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(drv ~ .)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) + 
  facet_wrap(~ cyl, nrow = 2)

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() + 
  facet_grid(drv ~ .)

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() +
  facet_grid(. ~ drv)

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(vars(drv))

