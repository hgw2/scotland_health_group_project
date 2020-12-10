filter_comparison_plot  <- function (data, input) {
  reactive(
    data %>% 
      arrange(council_name) %>% 
      filter(year == input$select_alcohol_year,
             council_name %in% input$select_alcohol_council)
  )
}
  