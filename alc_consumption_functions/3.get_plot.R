plot_alcohol_data <- function(data) {

renderPlotly(
  ggplotly(
    data() %>% 
  ggplot() +
    aes(x = reorder(council_name, percentage_increase),
        y = percentage_increase, 
        fill = factor(council_name), 
        text = paste("\nNumber of Patients (",year,")",": ", number_of_patients,
                     "\nNumber of Patients (", year - 1,")",": ", year_before,
                     "\nPercentage Change: ", percentage_increase, "%", sep ="") ) +
    geom_col()+ 
    guides(fill = FALSE) +
    coord_flip()+
    labs(y = "Pecentage Change (%)")+
    theme(
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      axis.title.y = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background = element_blank()
    ),tooltip = "text"
  ) %>% 
    hide_legend()
  
  )


}