leaflet_basemap <- function(data){
  
  renderLeaflet(
      leaflet() %>% 
      addTiles(attribution = paste(
        "&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a>",
        "Contains public sector information licensed under OPG v3.0",
        "&copy; <a href=\"http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/\">OPG</a>"
      )
      ) %>% 
      setView(lng = -4.2026458, lat = 57.8937812, zoom = 5.9) )
}