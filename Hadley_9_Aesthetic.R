library(tidyverse)

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) + 
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = class)) + 
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) + 
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color =  'Blue')

ggplot(mpg, aes(x = displ, y = hwy)) +  
  geom_point(shape = 17, color = 'pink', size = 3)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color =  'Blue'))

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(shape = 24, fill = 'pink', stroke = 1)

ggplot(mpg, aes(x = displ, y = hwy, color = displ < 5)) +
  geom_point() 

