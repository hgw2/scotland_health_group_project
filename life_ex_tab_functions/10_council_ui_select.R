get_council_ui_select <- function(data, top_and_bottom) {
  councils <- data %>% 
    filter(council_name != "Scotland Wide") %>% 
    distinct(council_name) %>% 
    pull
  
  renderUI(pickerInput(
    inputId = "select_council",
    label = "Councils in Scotland",
    choices = councils,
    selected = top_and_bottom(),
    options = list(`actions-box` = TRUE),
    multiple = T
  ))
}