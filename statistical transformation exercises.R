library(tidyverse)

ggplot(diamonds, mapping = aes(x = cut)) +
  geom_bar()

diamonds <- diamonds

ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) + 
  geom_bar()

ggplot(diamonds) +
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(diamonds, aes(x = cut, y = depth)) +
  geom_pointrange(
    stat = "summary",
    fun.min = min,
    fun.max = max,
    fun = median
  )

diamonds |> 
  ggplot(aes(x = cut, y = price)) +
  geom_col()

diamonds |> 
  ggplot(aes(x = cut)) +
  geom_bar()

?stat_smooth()

ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) + 
  geom_bar()

ggplot(diamonds, aes(x = cut, fill = color, y = after_stat(prop), group = 1)) + 
  geom_bar()

ggplot(mpg, aes(x = drv, color = drv)) +
  geom_bar()

ggplot(mpg, aes(x = drv, fill = drv)) +
  geom_bar()

ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar()

ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar(alpha = 1/5, position = "identity")


ggplot(mpg, aes(x = drv, fill = class)) +
  geom_bar(alpha = 1/5, position = "stack")

ggplot(mpg, aes(x = drv, color = class)) +
  geom_bar(fill = NA, position = "identity")

ggplot(mpg, aes(x = drv, color = class)) +
  geom_bar(fill = NA, position = "dodge")

ggplot(mpg, aes(x = drv, color = class)) +
  geom_bar(fill = NA, position = "jitter")

ggplot(mpg, aes(x = drv, color = class)) +
  geom_bar(fill = NA, position = "fill")

ggplot(mpg, aes(x = drv, color = class)) +
  geom_bar(fill = NA, position = "nudge")

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_jitter()

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_count()

mpg <- mpg

ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_count(stroke = 10)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_couunt(position = position_count(width = 2, height = 2))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = position_jitter(width = .01))

ggplot(mpg, aes(x = displ)) +
  geom_boxplot()


# working on debian 12/15 at 08:53 ----------------------------------------

library(tidyverse)
map_data

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = clarity, fill = clarity), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1)
bar
bar + coord_flip()
bar + coord_polar()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline(slope = 2, intercept = 30) +
  xlim(0, 100) +
  ylim(0, 100) 
