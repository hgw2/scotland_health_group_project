get_time_alcohol_plot  <- function(data) {
  
  renderPlotly(
    data() %>% 
      ggplot() +
      aes(x = year, y = value, colour = council_name) +
      geom_line(size = 1L) +
      scale_color_hue() +
      labs(x = "Year", y = "Number of hospital admissions", title = "Alcohol Related Hospital Admissions") +
      theme_minimal()
  )
  
}