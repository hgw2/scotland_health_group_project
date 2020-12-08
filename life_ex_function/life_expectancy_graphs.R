library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)
library(sf)
library(esquisse)

life_expectancy <- read_csv("clean_data/life_expectancy_clean.csv" )

## plot 1 life expectancy over time
life_expectancy %>% 
  filter(simd_quintiles == "All",
         council_name == "Scotland Wide") %>% #replace with reactive tag
  ggplot() +
  aes(x = year, y = life_expectancy, colour = sex) + # replace with reactive label
  geom_point(size = 1.5) +
  scale_color_viridis_d(option = "viridis") +
  labs(x = "Year", y = "Life expectancy (years)", title = "Life Expectancy Over Time") +
  theme_linedraw()+
  geom_line()+
  scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016))
  

## plot 2 life expectancy council by council, whether it is over or under the mean value
scotland_expectancy <- life_expectancy %>% 
  filter(council_name == "Scotland Wide", 
         year == 2017,
         simd_quintiles == "All") %>%
  select(sex, life_expectancy) %>% 
  rename(national_life_expectancy = life_expectancy)

life_expectancy_comparrison <- life_expectancy %>% 
  filter(year == 2017, 
         sex == "Female", #reactive input here
         simd_quintiles =="All", #reactive input here
         council_name != "Scotland Wide",
         council_name %in% ) %>% #reactive input here
  left_join(scotland_expectancy) %>% 
  mutate(difference_from_mean = life_expectancy - national_life_expectancy) %>% 
  arrange(council_name)

life_expectancy_comparrison_plot <- life_expectancy_comparrison %>% 
  arrange(council_name) %>% 
  ggplot() +
  aes(x = reorder(council_name, difference_from_mean), y = difference_from_mean, fill = life_expectancy > national_life_expectancy ) +
  geom_col()+ 
  guides(fill = FALSE) +
  coord_flip()+
  labs(x = "Difference from mean", y = "Life expectancy (years)", title = "Distance from the mean life expectancy")+
  geom_text(aes(label = life_expectancy,x = reorder(council_name, difference_from_mean)), nudge_y = if_else( life_expectancy_comparrison$difference_from_mean > 0, 0.3, -0.3), size = 3)+
  theme(
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_blank()
  )
life_expectancy_comparrison_plot

## plot 3 top 5 councils with highest life expectancy 2018

top_five <- life_expectancy %>% 
  select(council_name, sex, life_expectancy, year) %>% 
  filter(year == 2017,
         sex == "Female",
         council_name == "Scotland Wide") %>% 
  slice_max(life_expectancy, n = 5)

## plot 4 bottom 4 councils with lowest life expectancy in 2018

life_expectancy %>% 
  select(council_name, sex, life_expectancy, year) %>% 
  filter(year == 2017,
         sex == input$reactive,
         council_name == input$) %>% 
  slice_min(life_expectancy, n = 5)