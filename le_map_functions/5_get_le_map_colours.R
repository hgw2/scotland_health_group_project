get_le_map_colours <- function(map, spatial_data) {

  pal <- colorFactor(c("#fc8e59", "#feffbf"),
    domain = spatial_data()$over_mean)
  
   label <-  sprintf(
     "<strong>%s</strong><br/>Life Expectancy: %g years <br/> National Average: %g years <br/> Difference From National Average: %g years",
     spatial_data()$council_name, 
     spatial_data()$life_expectancy, 
     spatial_data()$national_life_expectancy,
     spatial_data()$difference_from_mean
   ) %>% lapply(htmltools::HTML)


                   
                   
    leafletProxy(map, data = spatial_data()) %>%
      clearControls() %>%
      addPolygons(
        fillColor = ~ pal(over_mean),
        weight = 2,
        opacity = 10,
        color = "black",
        dashArray = "3",
        fillOpacity = 1.5,
        highlight = highlightOptions(
          weight = 5,
          color = "#666",
          dashArray = "",
          fillOpacity = 0.7,
          bringToFront = TRUE
        ),
        label = label,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "15px",
          direction = "auto"
        )
      )
  
}
