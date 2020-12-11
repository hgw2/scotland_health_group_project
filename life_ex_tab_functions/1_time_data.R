get_time_data <- function(data, input){
  
 reactive({
   req(input$select_council)
  scotland <-  data %>%
      filter(simd_quintiles == "All",
             council_name == "Scotland Wide",
             sex == input$select_sex) %>% 
      select(sex, life_expectancy, year) %>%
      rename(national_life_expectancy = life_expectancy)
  
  council <- data %>%
     filter(simd_quintiles == "All",
            council_name != "Scotland Wide",
            council_name %in% input$select_council,
            sex == input$select_sex) 
  
  council %>% 
     left_join(scotland) %>%
     mutate(difference_from_mean = life_expectancy - national_life_expectancy) %>%
     arrange(council_name) 
      })
  
}