get_council_le <- function(data, input){
  reactive(data %>%
             filter(council_name != "Scotland Wide",
                    sex %in% input$select_sex,
                    year == input$select_year,
                    simd_quintiles == "All") %>% 
             filter(council_name %in% input$select_council)
  )
}