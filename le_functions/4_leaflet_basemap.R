leaflet_basemap <- function(data){
  
  renderLeaflet(
    data %>% 
      leaflet() %>% 
      setView(lng = -4.2026458, lat = 57.8937812, zoom = 5.9) %>% 
      addTiles()
  )
}