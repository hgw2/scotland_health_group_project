source("overview_functions/create_map.R")


server <- function(input, output) { 
  output$map <- createMap(data = life_expectancy)
  

  }