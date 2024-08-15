library(nycflights13)
library(tidyverse)

nycflights13::flights
glimpse(flights)
filter(flights, dep_delay > 120)
filter(flights, month == 1 & day == 1)
filter(flights, month %in% c(1,2))

arrange(flights, year, month, day, dep_time)
arrange(flights, desc(dep_delay))

distinct(flights, origin, dest)
distinct(flights, origin, dest, .keep_all = TRUE)
count(flights, origin, dest, sort = TRUE)

filter(flights, dest %in% c('IAH', 'HOU'))
distinct(flights, carrier)
filter(flights, carrier %in% c('UA', 'AA', 'DL'))
filter(flights, month >= 7 & month < 10)
filter(flights, dep_delay <= 0 & arr_delay > 120)
filter(flights, dep_delay >= 60 & dep_delay - arr_delay > 30)

arrange(flights, desc(dep_delay))
arrange(flights, dep_time)
arrange(flights, air_time)

arrange(flights, distance/air_time)

distinct(flights, year, month, day)
count(flights, year, month, day)

arrange(flights, distance)
filter(arrange(flights, distance), dest == 'IAH')
arrange(filter(flights, dest == 'IAH'), distance)

mutate(flights, speed = distance / air_time * 60, .before = 1)
mutate(flights, speed = distance / air_time * 60, gain = dep_delay - arr_delay, .keep = 'used')
select(flights, year:day)
select(flights, last_col())
select(flights, where(is.character))
select(flights, contains('time'))
select(flights, scheddy = sched_dep_time)

rename(flights, scheddy = sched_dep_time)
relocate(flights, time_hour)
relocate(flights, carrier, .before = dep_delay)

mutate(flights, delay = dep_time - sched_dep_time == dep_delay, .keep = 'used')
select(flights, starts_with('dep'), starts_with('arr'))
select(flights, ends_with('time'), ends_with('delay'))
select(flights, dep_time:arr_delay & !contains('sched'))
select(flights, arr_time, arr_time, arr_time)
select(flights, !any_of(c('balls', 'arr_time')))
select(flights, contains('TIME'))
relocate(flights, air_time_min = air_time)

summarize(group_by(flights, month), mean(dep_delay, na.rm = TRUE), n())
slice_max(group_by(flights, dest), arr_delay) |> relocate(dest)

flights |> 
  group_by(carrier, dest) |> 
  summarise(del = mean(dep_delay, na.rm = TRUE), .groups = 'drop') |> 
  slice_max(del, n = 15)

slice_max(group_by(flights, origin), dep_delay) |> relocate(origin) 

ggplot(flights, aes(sched_dep_time, dep_delay)) + geom_point()
df = tibble(x = 1:5, 
            y = c('a', 'b', 'a', 'a', 'b'), 
            z = c('K', 'K', 'L', 'L', 'K'))
group_by(df, y)
arrange(df, y)
summarise(group_by(df, y), mean(x))
summarise(group_by(df, y, z), mean(x))
summarise(group_by(df, y, z), mean(x), .groups = 'drop')
mutate(group_by(df, y, z), mean(x))

batters = group_by(Lahman::Batting, playerID) |> 
  summarise(performance = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE), 
            n = sum(AB, na.rm = TRUE))
ggplot(batters, aes(x = n, y = performance)) + 
  geom_point(alpha = 1/10) +
  geom_smooth(se = FALSE) 

