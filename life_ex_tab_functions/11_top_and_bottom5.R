get_top_and_bottom5 <- function(data,input){
  reactive({
    req(input$select_sex)
    req(input$select_year)
    data %>% 
      filter(council_name != "Scotland Wide",
             sex %in% input$select_sex,
             year %in% input$select_year) %>% 
      arrange(life_expectancy) %>% 
      dplyr::slice(c(1:5,(n()-4): n())) %>% 
      distinct(council_name) %>% 
      pull()
  }) 
}