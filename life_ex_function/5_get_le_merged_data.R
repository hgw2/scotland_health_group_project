get_le_merge_data <- function(council, scotland){
  reactive(council() %>%
    left_join(scotland()) %>%
    mutate(difference_from_mean = life_expectancy - national_life_expectancy) %>%
    arrange(council_name) )
}