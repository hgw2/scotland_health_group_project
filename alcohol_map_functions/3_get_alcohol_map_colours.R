get_alcohol_map_colours <- function(map, spatial_data) {
  
  pal<- colorFactor(c("#FF0000", "#008000"),
                    domain = spatial_data()$increase_decrease)
  
  label <- paste(spatial_data()$council_name,"=", spatial_data()$percentage_increase)
  
  leafletProxy(map, data = spatial_data()) %>%
    clearControls() %>%
    addPolygons(fillColor = ~pal(increase_decrease),
                weight = 1,
                opacity = 1,
                color = "white",
                dashArray = "3",
                fillOpacity = 0.8,
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
  
}