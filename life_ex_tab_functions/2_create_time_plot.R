create_time_plot <- function(data){
  renderPlotly(
    ggplotly(
    data() %>% 
    ggplot() +
     aes( text = paste(
       "Council:", council_name,
       "\nLife Expectancy:", life_expectancy))+
    geom_point(aes(x = year,
                   y = life_expectancy,
                   colour = factor(council_name)),
               size = 1.5) +
      geom_line(aes(x = year,
                    y = life_expectancy,
                    colour = factor(council_name), 
                    grp = factor(council_name), group = 1,))+
      geom_line(aes(x= year,
                    y =national_life_expectancy,
                    fill = "black", group = 1, 
                    text = paste("National Average", national_life_expectancy))
                )+
    labs(x = "Year", y = "Life expectancy (years)") +
    theme_linedraw() +
    scale_x_continuous(breaks = c(1992,1996,2000,2004,2008,2012,2016)
                       ), 
    tooltip = "text"
    ) %>% 
      hide_legend()
      
  )

}