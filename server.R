server <- function(input, output) {
reactive_plot_time <- reactive({life_expectancy %>%
      filter(simd_quintiles == "All",
             council_name == "Scotland Wide",
             sex == input$select_sex)
})


  output$life_expectancy_time <- renderPlot(
    reactive_plot_time() %>% 
        ggplot() +
        aes(x = year, y = life_expectancy, colour = sex) + 
        geom_point(size = 1.5) +
        scale_color_viridis_d(option = "viridis") +
        labs(x = "Year", y = "Life expectancy (years)", title = "Life Expectancy Over Time") +
        theme_linedraw()+
        geom_line()+
        scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016))
  )

  output$life_expectancy_comparison <- renderPlot(
    life_expectancy_comparison_plot
  )


  output$top_five <- renderDataTable(
    top_five
  )

  output$bottom_five <- renderDataTable(
   bottom_five
  )

  }
