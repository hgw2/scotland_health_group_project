get_time_data <- function(data, input){
  
 reactive(data %>%
      filter(simd_quintiles == "All",
             council_name %in% input$select_council,
             sex == "Both") 
      )
  
}