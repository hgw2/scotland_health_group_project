server <- function(input, output) {

  output$life_expectancy_time <- renderPlot(
    life_expectancy_over_time_plot
  )

  output$life_expectancy_comparison <- renderPlot(
    life_expectancy_comparison_plot
  )


  output$top_five <- renderDT(
    top_five
  )

  output$bottom_five <- renderDT(
    bottom_five
  )

  }
