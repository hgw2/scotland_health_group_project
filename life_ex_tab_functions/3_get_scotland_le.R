get_scotland_le <- function(data, input){
  reactive({
    req(input$select_sex)
    req(input$select_year)
    data %>%
             filter(council_name == "Scotland Wide",
                    sex %in% input$select_sex,
                    year == input$select_year,
                    simd_quintiles == "All") %>%
             select(sex, life_expectancy) %>%
             rename(national_life_expectancy = life_expectancy)
           })
}