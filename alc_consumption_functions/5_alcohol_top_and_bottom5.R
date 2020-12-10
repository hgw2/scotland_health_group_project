get_alcohol_top_and_bottom5 <- function(data,input){
  reactive(
  data %>% 
    filter(year %in% input$select_alcohol_year) %>% 
    arrange(percentage_increase) %>% 
   slice(1:5) %>% 
    distinct(council_name) %>% 
    pull()
) 
  }
