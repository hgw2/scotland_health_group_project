get_le_comparison_plot <- function(data){
renderPlotly(
 ggplotly(
   data() %>% 
  ggplot() +
  aes(x = reorder(council_name, difference_from_mean), 
      y = difference_from_mean, 
      fill = life_expectancy > national_life_expectancy,
      label = life_expectancy) +
  geom_col()+
  guides(fill = FALSE) +
  coord_flip()+
  labs(x = "Difference from mean", y = "Life expectancy (years)")+
  theme(
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank(),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_blank()
  ), tooltip = "label"
  )
 )
  

}