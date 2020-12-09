library(tidyverse)
library(lubridate)
library(sf)
library(shiny)
library(shinydashboard)
library(plotly)
library(leaflet)
library(DT)
library(shinyWidgets)

# load module functions
source("life_ex_function/life_expectancy_graphs.R")
# load ui elements
source("ui.R")
# load server function
source("server.R")
