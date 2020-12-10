get_alcohol_council_ui_select <- function(data) {
renderUI(pickerInput(
  inputId = "select_alcohol_council",
  label = "Councils in Scotland",
  choices = c(unique(data$council_name)),
  selected = c(unique(data$council_name)),
  options = list(`actions-box` = TRUE),
  multiple = T
))
}