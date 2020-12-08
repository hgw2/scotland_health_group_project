
source("overview_functions/get_map_data.R")
createMap <- function(data) {
  
  data <- map_data(data)
 
   pal<- colorNumeric("YlOrRd",data$difference_from_mean)
  
   label <- paste(data$council_name,"=", data$life_expectancy)
 
   renderLeaflet(
    data %>% 
      leaflet() %>% 
      addTiles() %>% 
      addPolygons(
        fillColor = ~pal(difference_from_mean > 0),
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
          direction = "auto")
      )
    )
 

  
    
}
