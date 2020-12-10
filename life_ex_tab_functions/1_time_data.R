get_time_data <- function(data, input){
  
 reactive({
   req(input$select_council)
   data %>%
      filter(simd_quintiles == "All",
             council_name %in% input$select_council,
             sex == "Both") 
      })
  
}