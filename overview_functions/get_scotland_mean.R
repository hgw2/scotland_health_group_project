scotland_wide_data <-function(data) {
 data %>% 
      filter(council_name == "Scotland Wide",
             sex == "Both",
             year == 2011,
             simd_quintiles == "All") %>%
      select(sex, life_expectancy) %>% 
      rename(national_life_expectancy = life_expectancy)
}