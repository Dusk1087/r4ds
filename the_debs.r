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


ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut_number(carat, 2)), binwidth = 500) +
  labs(color = "Carat Size Group")

library(tidyverse)
ggplot(smaller, aes(x = carat, y = price)) + 
  geom_bin2d()

ggplot(smaller, aes(x = carat, y = price)) +
  geom_hex()

ggplot(smaller, aes(x = carat, y = price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.5)))

ggplot(smaller, aes(x = carat, y = price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.5)), varwidth = TRUE)


ggplot(smaller, aes(x = carat, y = price)) +
  geom_boxplot()

diamonds |> 
  filter(x >= 4) |> 
  ggplot(aes(x = x, y = y)) +
  geom_point() +
  coord_cartesian(xlim = c(4, 11), ylim = c(4, 11))

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly()

small_diamonds <- 
  filter(diamonds, price < 10000)


expensive_diamonds <- 
  filter(diamonds, price >= 10000)


ggplot(expensive_diamonds, aes(x = price)) +
  geom_freqpoly()


# first model -------------------------------------------------------------

library(tidymodels)

diamonds <- diamonds |>
  mutate(
    log_price = log(price),
    log_carat = log(carat)
  )

diamonds_fit <- linear_reg() |>
  fit(log_price ~ log_carat, data = diamonds)

diamonds_aug <- augment(diamonds_fit, new_data = diamonds) |>
  mutate(.resid = exp(.resid), .pred2 = exp(.pred))

ggplot(diamonds_aug, aes(x = carat, y = .resid)) + 
  geom_point()

diamonds_aug

exp(6)
?plotmath

library(tidyverse)
library(scales)
library(ggrepel)
library(patchwork)

df <- tibble(
  x = 1:10,
  y = cumsum(x^2)
)

ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(x[i]),
    y = quote(sum(x[i] ^ 2, i == 1, n))
  )

mpg <- mpg
mpg |> 
  ggplot(aes(x = cty, y = hwy)) +
  geom_point(aes(color = drv)) +
  labs(
    x = "City mpg",
    y = "Highway mpg", 
    title = "Example title",
    color = "Type of drive train",
    caption = "d4rds"
  )

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

label_info

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_text(
    data = label_info,
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, hjust = "right", vjust = "bottom"
  ) + 
  theme(legend.position = "none")

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_label_repel(
    data = label_info,
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, nudge_y = 2
  ) +
  theme(legend.position = "none")


# geom_text_repel example -------------------------------------------------
?geom_text_repel

potential_outliers <- mpg |> 
  filter(hwy > 40 | (hwy > 20 & displ >5)) 

ggplot(mpg, aes( x = displ, y = hwy)) +
  geom_point() +
  geom_text_repel(data = potential_outliers, aes(label = cyl)) +
  geom_point(data = potential_outliers, color = "red") +
  geom_point(
    data = potential_outliers, 
    color = "red", 
    size = 3, 
    shape = "circle open"
  ) +
  geom_rect(xmin = 2, xmax = 4, ymin = 20, ymax = 30, alpha = 1/100, color = "blue", fill = "white") +
  geom_hline(yintercept = 15, linewidth = 2, color = "white") +
  geom_segment(aes(x = 2, y = 20, xend = 5, yend = 30), arrow = arrow()) + 
  annotate("text", x = 5, y = 35, label = "test")


trend_text <- "Larger engine sizes tend to have lower fuel economy." |>
  str_wrap(width = 30)
trend_text

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  annotate(
    geom = "label", x = 3.5, y = 38,
    label = trend_text,
    hjust = "left", color = "red"
  ) +
  annotate(
    geom = "segment",
    x = 3, y = 35, xend = 5, yend = 25, color = "blue",
    arrow = arrow(length = unit(2, "cm"),type = "closed")
  )

# jumping ahead to the chapter on base R ----------------------------------

library(tidyverse)
x <- c("one", "two", "three", "four", "five")
x[c(3, 3, 3, 3, 2, 5)]
x[c(-1, -3, -5)]
x <- c(10, 3, NA, 5, 8, 1, NA)
x[!is.na(x)]
x[x %% 2 == 0]
x[]

df <- tibble(
  x = 1:3,
  y = c("a", "e", "f"),
  z = runif(3)
)

df[1,2]
df[,c("x", "y")]
df[df$x >= 1, ]
df |> filter(x > 1)
df[which(df$x > 1),]

df1 <- data.frame(x = 1:3)
df1[,"x", drop = FALSE]

df2 <- tibble(x = 1:3)
df2[,"x"]

df |> arrange(x, y)
df[order(df$x, df$y), decreasing = TRUE]


tb <- tibble(
  x = 1:4,
  y = c(10, 4, 1, 21)
)

# by position
tb[[1]]
#> [1] 1 2 3 4

# by name
tb[["x"]]
#> [1] 1 2 3 4
tb$x
#> [1] 1 2 3 4

tb$z <-tb$x + tb$y

diamonds
max(diamonds$carat)
max(diamonds$cut)

l <- list(
  a = 1:3, 
  b = "a string", 
  c = pi, 
  d = list(-1, -5)
)
str(l[1])
str(l[[1]])


str(l[4])


