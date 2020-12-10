create_time_plot <- function(data){
  renderPlotly(
    ggplotly(
    data() %>% 
    ggplot() +
    aes(x = year, y = life_expectancy, colour = factor(council_name), grp = factor(council_name)) + 
    geom_point(size = 1.5) +
    labs(x = "Year", y = "Life expectancy (years)") +
    theme_linedraw()+
    geom_line()+
    scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016)
                       ), 
    tooltip = c("colour", "y")
    ) %>% 
      hide_legend()
      
  )

}