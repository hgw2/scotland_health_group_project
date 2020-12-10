get_le_map_legend <- function(map, spatial_data){

   pal <- colorFactor(c("#008000", "#FF0000"), 
                                domain = spatial_data()$over_mean)
             
  
  
    leafletProxy(map, data = spatial_data()) %>%
      clearControls() %>% 
      addLegend(position = "topleft",
                pal = pal, values = ~over_mean, 
                title = "Over Mean Life Expectancy")
  
}