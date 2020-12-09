source("life_ex_function/1_time_data.R")
source("life_ex_function/2_create_time_plot.R")
source("life_ex_function/3_get_scotland_le.R")
source("life_ex_function/4_get_council_le.R")
source("life_ex_function/5_get_le_mereged_data.R")
source("life_ex_function/6_get_le_comparison_plot.R")

server <- function(input, output) {

time_data <- get_time_data(data = life_expectancy, input = input)
output$life_expectancy_time <- create_time_plot(time_data)
scotland <- get_scotland_le(data = life_expectancy, input = input)
council <- get_council_le(data = life_expectancy, input = input)
le_comparison_data <- get_le_merge_data(council, scotland)
output$life_expectancy_comparison <- get_le_comparison_plot(le_comparison_data)






  output$top_five <- renderDataTable(
    top_five
  )

  output$bottom_five <- renderDataTable(
   bottom_five
  )

  }
