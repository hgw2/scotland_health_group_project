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
    pal <- colorFactor(c("#008000", "#FF0000"), domain = spatial_data()$over_mean)
    label <- paste(spatial_data()$council_name,"=", spatial_data()$life_expectancy)
    leafletProxy("map", data = spatial_data()) %>% 
      clearControls() %>% 
      addPolygons(fillColor = ~pal(over_mean),
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillOpacity = 10,
    highlight = highlightOptions(
      weight = 5,
      color = "#666",
      dashArray = "",
      fillOpacity = 0.7,
      bringToFront = TRUE),
    label = label,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))
  })
  
  observe({
    pal <- colorFactor(c("#008000", "#FF0000"), domain = spatial_data()$over_mean)
    leafletProxy("map", data = spatial_data()) %>%
      clearControls() %>% 
      addLegend(position = "topleft",
                pal = pal, values = ~over_mean, 
                title = "Over Mean Life Expectancy")
      })
  

  }