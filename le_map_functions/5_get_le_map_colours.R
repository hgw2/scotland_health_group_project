get_le_map_colours <- function(map, spatial_data) {

  pal <- colorFactor(c("#008000", "#FF0000"),
    domain = spatial_data()$over_mean)
  
   label <- paste(
    spatial_data()$council_name,
    "=",
    spatial_data()$life_expectancy)


    
    leafletProxy(map, data = spatial_data()) %>%
      clearControls() %>%
      addPolygons(
        fillColor = ~ pal(over_mean),
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
