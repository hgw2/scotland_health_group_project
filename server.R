source("life_ex_function/1_time_data.R")
source("life_ex_function/2_create_time_plot.R")
source("life_ex_function/3_get_scotland_le.R")
source("life_ex_function/4_get_council_le.R")
source("life_ex_function/5_get_le_mereged_data.R")
source("life_ex_function/6_get_le_comparison_plot.R")
source("life_ex_function/7_time_data.R")
source("life_ex_function/8_slice_max.R")
source("life_ex_function/9_slice_min.R")
source("le_map_functions/1_get_scotland_le_map.R")
source("le_map_functions/2_get_council_le_map.R")
source("le_map_functions/3_get_spatial.R")
source("le_map_functions/4_leaflet_basemap.R")

server <- function(input, output) {

time_data <- get_time_data(data = life_expectancy, input = input)
output$life_expectancy_time <- create_time_plot(time_data)
scotland <- get_scotland_le(data = life_expectancy, input = input)
council <- get_council_le(data = life_expectancy, input = input)
le_comparison_data <- get_le_merge_data(council, scotland)
output$life_expectancy_comparison <- get_le_comparison_plot(le_comparison_data)

time_data_three_filters <- get_time_data_three_filters(data = life_expectancy, 
                                                       input = input)
output$top_five <-create_slice_max(time_data_three_filters)
output$bottom_five <- create_slice_min(time_data_three_filters)

scotland_map <- get_scotland_le_map(data = life_expectancy, input = input)
council_map <-get_council_le_map(data = life_expectancy, input = input)
spatial_data <- get_spatial(council = council_map, scotland = scotland_map)
output$map <- leaflet_basemap(spatial_data)

  
  observe({
    pal <- colorFactor(c("#008000", "#FF0000"), 
                       domain = spatial_data()$over_mean)
    label <- paste(spatial_data()$council_name,
                   "=", 
                   spatial_data()$life_expectancy)
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
    pal <- colorFactor(c("#008000", "#FF0000"), 
                       domain = spatial_data()$over_mean)
    leafletProxy("map", data = spatial_data()) %>%
      clearControls() %>% 
      addLegend(position = "topleft",
                pal = pal, values = ~over_mean, 
                title = "Over Mean Life Expectancy")
      })
  

  }

