source("le_functions/1_get_scotland_le.R")
source("le_functions/2_get_council_le.R")
source("le_functions/3_get_spatial.R")
source("le_functions/4_leaflet_basemap.R")


server <- function(input, output) { 
  scotland <- get_scotland_le(data = life_expectancy, input = input)
  council <-get_council_le(data = life_expectancy, input = input)
  spatial_data <- get_spatial(council = council, scotland = scotland)
  output$map <- leaflet_basemap(spatial_data)
  
  observe({
    leafletProxy("map", data = spatial_data()) %>% 
      addPolygons()
  })
  

  }