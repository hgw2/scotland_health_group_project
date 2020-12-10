get_alcohol_council_ui_select <- function(data, top_and_bottom) {
renderUI(pickerInput(
  inputId = "select_alcohol_council",
  label = "Councils in Scotland",
  choices = c(unique(data$council_name)),
  selected = "All" ,
  options = list(`actions-box` = TRUE),
  multiple = T
))
}