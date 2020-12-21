get_le_map_legend <- function(map, spatial_data){

   pal <- colorFactor(c("#fc8e59", "#feffbf"), 
                                domain = spatial_data()$over_mean)
             
  
  
    leafletProxy(map, data = spatial_data()) %>%
      clearControls() %>% 
      addLegend(position = "topleft",
                pal = pal, values = ~over_mean, 
                title = "Life Expectancy")
  
}