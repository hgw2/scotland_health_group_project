library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)
library(sf)
library(esquisse)

life_expectancy <- read_csv("clean_data/life_expectancy_clean.csv" )

## plot 1
life_expectancy %>% 
  filter(simd_quintiles == "All") %>% 
  filter(council_name == "Scotland Wide") %>% 
ggplot() +
  aes(x = year, y = life_expectancy, colour = sex) +
  geom_line(size = 1L) +
  scale_color_hue() +
  theme_minimal()