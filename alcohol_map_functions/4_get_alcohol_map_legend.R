get_alcohol_map_legend <- function(map, spatial_data){
  
  pal <- colorFactor(c("#fc8e59", "#feffbf"), 
                     domain = spatial_data()$increase_decrease)
  
  
  
  leafletProxy(map, data = spatial_data()) %>%
    clearControls() %>% 
    addLegend(position = "topleft",
              pal = pal, values = ~increase_decrease, 
              title = "Alcohol Realted Hospital Admisions")
}