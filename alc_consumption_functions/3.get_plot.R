plot_alcohol_data <- function(data) {
  renderPlotly(
    ggplotly(data() %>% 
  ggplot() +
    aes(x = reorder(council_name, percentage_increase), y = percentage_increase, fill = percentage_increase > 0 ) +
    geom_col()+ 
    guides(fill = FALSE) +
    coord_flip()+
    geom_text(aes(label = percentage_increase ,x = reorder(council_name, percentage_increase)), nudge_y = if_else( patients_from_last_year$percentage_increase > 0, 0.3, -0.3), size = 3)+
    theme(
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      axis.title.y = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background = element_blank()
    )))
}