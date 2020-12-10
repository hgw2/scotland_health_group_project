get_alcohol_map_legend <- function(map, spatial_data){
  
  pal <- colorFactor(c("#FF0000", "#008000" ), 
                     domain = spatial_data()$increase_decrease)
  
  
  
  leafletProxy(map, data = spatial_data()) %>%
    clearControls() %>% 
    addLegend(position = "topleft",
              pal = pal, values = ~increase_decrease, 
              title = "Alcohol Realted Hospital Admisions")
}