get_council_le <- function(data, input){
  reactive({
    req(input$select_sex)
    req(input$select_year)
    data %>%
             filter(council_name != "Scotland Wide",
                    sex %in% input$select_sex,
                    year == input$select_year,
                    simd_quintiles == "All") %>% 
             filter(council_name %in% input$select_council)
  })
}