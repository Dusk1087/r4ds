library(tidyverse)

#enter data by column
tibble(
  x = c(1, 2, 3),
  y = c("h", "m", "g"),
  z = c(0.08, 0.83, 0.60)
)

#enter data by row, use the transposed tibble
tribble(
  ~x, ~y, ~z,
  1, "h", 0.08,
  2, "m", 0.83,
  3, "g", 0.60
)

