get_time_alcohol_plot  <- function(data) {
  
  renderPlotly(
    ggplotly(
    data() %>% 
      ggplot() +
      aes(x = year, 
          y = value, 
          colour = factor(council_name), 
          grp = factor(council_name), group = 1,
                       text = paste("Council:", council_name,
                                    "\nNumber of Patients (", year,"): ", value, sep ="")) +
      geom_point(size = 1.5) +
      labs(x = "Year", y = "Number of Patients") +
      theme_linedraw()+
      geom_line()+
      scale_x_continuous(breaks = c(1998,2002,2004,2008, 2012,2016)),
    
    tooltip = "text"
    ) %>% 
      hide_legend()
    
                         
  )
  
}