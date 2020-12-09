get_council_le <- function(data, input){
  
  reactive(data %>% 
             filter(council_name != "Scotland Wide",
                    sex == "Both",
                    year == input$year,
                    simd_quintiles == "All") 
           
           
  )
}