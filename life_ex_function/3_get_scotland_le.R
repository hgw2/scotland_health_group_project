get_scotland_le <- function(data, input){
  reactive(data %>%
             filter(council_name == "Scotland Wide",
                    sex %in% input$select_sex,
                    year == input$select_year,
                    simd_quintiles == "All") %>%
             select(sex, life_expectancy) %>%
             rename(national_life_expectancy = life_expectancy)
           )
}