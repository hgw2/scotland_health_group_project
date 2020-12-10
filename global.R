library(tidyverse)
library(lubridate)
library(sf)
library(shiny)
library(shinydashboard)
library(plotly)
library(leaflet)
library(DT)
library(shinyWidgets)

life_expectancy <- read_csv("clean_data/life_expectancy_clean.csv")
alcohol_hospitals <- read_csv("clean_data/alcohol_hospitals_data_clean.csv")

