create_slice_min <- function(data){
  renderDataTable(
    data() %>% 
      slice_min(life_expectancy, n = 5)
  )
  
}