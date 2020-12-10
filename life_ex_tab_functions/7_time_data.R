get_time_data_three_filters <- function(data, input){
  
  reactive(data %>%
             select(council_name, sex, life_expectancy, year) %>%
             filter(council_name != "Scotland Wide",
                    sex %in% input$select_sex,
                    year %in% input$select_year) 
  )
  
}