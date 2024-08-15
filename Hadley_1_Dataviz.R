library(tidyverse)
library(palmerpenguins)
library(ggthemes)

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(color = species, shape = species)) + 
  geom_smooth(method = 'lm') + 
  labs(title = 'Body Mass and Flipper Length',
       caption = 'From palmerpenguins dataset',
       subtitle = 'From palmerpenguins dataset', 
       x = 'Flipper length (mm)', 
       y = 'Body mass (g)', 
       color = 'Species', shape = 'Species') + 
  scale_color_colorblind()

ggplot(data = penguins, 
       mapping = aes(x = bill_length_mm, y = bill_depth_mm)) + 
  geom_point(na.rm = TRUE)

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(mapping = aes(color = bill_depth_mm)) + 
  geom_smooth()

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot()  + 
  geom_point(data = penguins, 
             mapping = aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_smooth(data = penguins, 
              mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(penguins, aes(y = fct_infreq(species))) +
  geom_bar(aes(fill=island)) 

ggplot(penguins, aes(x = body_mass_g)) + 
  geom_histogram(color='blue', binwidth = 200)

ggplot(penguins, aes(x = body_mass_g)) + 
  geom_density(color='blue')

ggplot(diamonds, aes(x = carat)) + 
  geom_histogram(fill = 'red', binwidth = 0.5)

ggplot(penguins, aes(x = species, y = body_mass_g)) + 
  geom_boxplot()

ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(size = 1.5, alpha = 0.5)

ggplot(penguins, aes(x = island, fill = species)) + 
  geom_bar(position = 'fill')

ggplot(mpg, aes(x = displ, y = hwy, color = year, size = year, shape = trans)) + 
  geom_point()

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) + 
  geom_point() + 
  facet_wrap(~ species)

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) + 
  geom_point() + 
  labs(color = 'Species', shape = 'Species')
ggsave('penguin-plot.png')

ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_point()
ggsave('mpg-plot.pdf')


