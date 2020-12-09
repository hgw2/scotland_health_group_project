create_slice_max <- function(data){
  renderDataTable(
    data() %>% 
     slice_max(life_expectancy, n = 5)
  )
  
}