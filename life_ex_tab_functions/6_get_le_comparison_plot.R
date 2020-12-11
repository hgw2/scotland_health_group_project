get_le_comparison_plot <- function(data){
renderPlotly(
 ggplotly(
   data() %>% 
     filter(council_name != "Scotland Wide") %>%
  ggplot() +
  aes(
      text = paste("Life Expectancy:", life_expectancy, "years",
                   "\nNational Average", national_life_expectancy, "years",
                   "\nDifference From Mean:", round(difference_from_mean, 2), "years")) +
  geom_col(aes(x = reorder(council_name, difference_from_mean), 
           y = difference_from_mean, 
           fill = factor(council_name)))+
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
  ), tooltip = "text"
  ) %>% 
 hide_legend()
 )
  

}