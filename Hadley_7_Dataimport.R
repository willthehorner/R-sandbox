library(tidyverse)
library(arrow)

students = read_csv('https://pos.it/r4ds-students-csv', na = c('N/A', ''))
good_name = rename(students, student_id = 'Student ID', full_name = 'Full Name')
good_table = mutate(good_name, 
  mealPlan = factor(mealPlan), 
  AGE = parse_number(if_else(AGE == 'five', '5', AGE))
)

read_csv('a, b, c 
         1, 2, 3 
         7, 8, 9', 
         col_names = c('omg', 'wtf', 'bbq'))

read_delim('I|am|big\nn|n|n', col_names = FALSE)

read_csv("x,y\n1, 'a,b'", quote = '\'')
read_csv("a;b\n1;3")

annoying = tibble(`1` = 1:10, 
                  `2` = `1` * 2 + rnorm(length(`1`)))
annoying$`1`
ggplot(annoying, aes(y=`1`, x=`2`)) + 
  geom_point()
annoying = mutate(annoying, `3` = `2` / `1`)
lannoying = select(annoying, 'one' = `1`, 'two' = `2`, 'three' = `3`)


read_csv('x,y,z
         1e6,2,3', 
         col_types = cols(.default = col_character()))
read_csv('x,y,z
         1e6,2,3', 
         col_types = cols_only(x = col_character()))

sales_files = c('http://pos.it/r4ds-01-sales', 
                'http://pos.it/r4ds-02-sales', 
                'http://pos.it/r4ds-03-sales')
read_csv(sales_files, id = 'file')

write_parquet(good_table, 'students.parquet')
read_parquet('students.parquet')

tibble(
  x = c(1, 2, 5), 
  y = c('q', 'm', 'p'), 
  z = c(0.08, 0.83, 0.60)
)

tribble(
  ~x, ~y, ~z, 
  1, 'q', 0.08, 
  2, 'm', 0.83, 
  5, 'p', 0.60
)

y = 1:4
mean(y)
reprex::reprex()
