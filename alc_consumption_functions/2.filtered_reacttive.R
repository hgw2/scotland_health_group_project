filter_comparison_plot  <- function (data, input) {
  reactive(
    data %>% 
      arrange(council_name) %>% 
      filter(year %in% input$select_year,
             council_name %in% input$council_select)
  )

  
}
  