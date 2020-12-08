server <- function(input, output) { 
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