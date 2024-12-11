read_csv("
  logical,numeric,date,string
  TRUE,1,2021-01-15,abc
  false,4.5,2021-02-15,def
  T,Inf,2021-02-16,ghi
")

simple_csv <- "
  x
  10
  .
  20
  30"

read_csv(simple_csv)

df <- read_csv(
  simple_csv,
  col_types = list(x = col_double()),
  na = "."
)

problems(df)
df

df <- read_csv(
  simple_csv,
  na = "."
)
df

another_csv <- "
x,y,z
1,2,3"

read_csv(
  another_csv, 
  col_types = cols(.default = col_character())
)

read_csv(
  another_csv,
  col_types = cols_only(x = col_character())
)

sales_files <- c(
  "https://pos.it/r4ds-01-sales",
  "https://pos.it/r4ds-02-sales",
  "https://pos.it/r4ds-03-sales"
)
sales_files_m1 <- read_csv(sales_files, id = "file")
sales_files_m1

sales_files_v1 <- c("data/01-sales.csv", "data/02-sales.csv", "data/03-sales.csv")
sales_files_v2 <- read_csv(sales_files_v1, id = "file")
sales_files_v2

