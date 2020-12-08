server <- function(input, output) { 
  output$life_expectancy_time <- renderPlot(
    life_expectancy %>% 
      filter(simd_quintiles == "All",
             council_name == "Scotland Wide") %>% #replace with reactive tag
      ggplot() +
      aes(x = year, y = life_expectancy, colour = sex) + # replace with reactive label
      geom_point(size = 1.5) +
      scale_color_viridis_d(option = "viridis") +
      labs(x = "Year", y = "Life expectancy (years)", title = "Life Expectancy Over Time") +
      theme_linedraw()+
      geom_line()+
      scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016))
  )

  output$top_five <- renderDataTable(life_expectancy %>% 
                                       select(council_name, sex, life_expectancy, year) %>% 
                                       filter(year == 2017,
                                              sex == "Female",
                                              council_name == "Scotland Wide") %>% 
                                       slice_max(life_expectancy, n = 5))
  output$bottom_five <- renderDataTable(life_expectancy %>% 
                                          select(council_name, sex, life_expectancy, year) %>% 
                                          filter(year == 2017,
                                                 sex == "Both",
                                                 council_name %in% "Scotland Wide") %>% 
                                          slice_min(life_expectancy, n = 5))
  }