create_time_plot <- function(data){
  renderPlot(
    data() %>% 
    ggplot() +
    aes(x = year, y = life_expectancy, colour = council_name, grp = council_name) + 
    geom_point(size = 1.5) +
    scale_color_viridis_d(option = "viridis") +
    labs(x = "Year", y = "Life expectancy (years)", title = "Life Expectancy Over Time") +
    theme_linedraw()+
    geom_line()+
    scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016))
  )

}