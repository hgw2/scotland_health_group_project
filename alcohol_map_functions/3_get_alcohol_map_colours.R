get_alcohol_map_colours <- function(map, spatial_data) {
  
  pal<- colorFactor(c("#fc8e59", "#feffbf"),
                    domain = spatial_data()$increase_decrease)
  
  label <- paste(spatial_data()$council_name,"=", spatial_data()$percentage_increase)
  
  label <-  sprintf(
    "<strong>%s</strong><br/>Percentage Change: %g&#37 <br/>Number of Patients (%g): %g per 100,000<br/> Number of Patients (Previous Year): %g per 100,000",
    spatial_data()$council_name, 
    spatial_data()$percentage_increase,
    spatial_data()$year,
    spatial_data()$number_of_patients,
    spatial_data()$year_before
    
  ) %>% lapply(htmltools::HTML)
  
  leafletProxy(map, data = spatial_data()) %>%
    clearControls() %>%
    addPolygons(fillColor = ~pal(increase_decrease),
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
                  bringToFront = TRUE),
                label = label,
                labelOptions = labelOptions(
                  style = list("font-weight" = "normal", padding = "3px 8px"),
                  textsize = "15px",
                  direction = "auto"))
  
}