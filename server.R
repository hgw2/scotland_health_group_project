# Read in life expectancy  map functions -----
source("le_map_functions/1_get_scotland_le_map.R")
source("le_map_functions/2_get_council_le_map.R")
source("le_map_functions/3_get_spatial.R")
source("le_map_functions/4_leaflet_basemap.R")
source("le_map_functions/5_get_le_map_colours.R")
source("le_map_functions/6_get_le_map_legend.R")

# Read in life expectancy tab functions ----
source("life_ex_tab_functions/1_time_data.R")
source("life_ex_tab_functions/2_create_time_plot.R")
source("life_ex_tab_functions/3_get_scotland_le.R")
source("life_ex_tab_functions/4_get_council_le.R")
source("life_ex_tab_functions/5_get_le_merged_data.R")
source("life_ex_tab_functions/6_get_le_comparison_plot.R")
source("life_ex_tab_functions/7_time_data.R")
source("life_ex_tab_functions/8_slice_max.R")
source("life_ex_tab_functions/9_slice_min.R")
source("life_ex_tab_functions/10_council_ui_select.R")
source("life_ex_tab_functions/11_top_and_bottom5.R")

# Read in alcohol consumption functions ----
source("alc_consumption_functions/1. patients_from_last_year.R")
source("alc_consumption_functions/2.filtered_reacttive.R")
source("alc_consumption_functions/3.get_plot.R")
source("alc_consumption_functions/4_council_alcohol_ui_select.R")
source("alc_consumption_functions/5_alcohol_top_and_bottom_5.R")
source("alc_consumption_functions/6_time_alcohol_data.R")
source("alc_consumption_functions/7_get_time_alcohol_plot.R")

# Server ----
server <- function(input, output) {

  # Get Life Expectancy Map Data ----
  scotland_map <- get_scotland_le_map(data = life_expectancy, input = input)
  council_map <- get_council_le_map(data = life_expectancy, input = input)
  spatial_data <- get_spatial(council = council_map, scotland = scotland_map)

  # Produce Life Expectancy Map ----

  output$map <- leaflet_basemap()

  observe(
    get_le_map_colours(map = "map", spatial_data = spatial_data)
  )

  observe(
    get_le_map_legend(map = "map", spatial_data = spatial_data)
  )

  # Get Life Expectancy UI
  output$council_select <- get_council_ui_select(
    data = life_expectancy,
    top_and_bottom = top_and_bottom5
  )


  top_and_bottom5 <- get_top_and_bottom5(
    data = life_expectancy,
    input = input
  )


  # Get Life Expectancy Tab Data ----

  # Time Data
  time_data <- get_time_data(data = life_expectancy, input = input)

  # Life Expectancy comparison
  scotland <- get_scotland_le(data = life_expectancy, input = input)
  council <- get_council_le(data = life_expectancy, input = input)
  le_comparison_data <- get_le_merge_data(council, scotland)

  # Top and Bottom 5
  time_data_three_filters <- get_time_data_three_filters(
    data = life_expectancy,
    input = input
  )


  # Produce Life Expectancy Tab Plots

  output$life_expectancy_time <- create_time_plot(time_data)

  output$life_expectancy_comparison <- get_le_comparison_plot(le_comparison_data)

  output$top_five <- create_slice_max(time_data_three_filters)
  
  output$bottom_five <- create_slice_min(time_data_three_filters)
  
  
  # Get Alcohol UI
  reactive
  output$council_alcohol_select <- get_alcohol_council_ui_select(
    data = patients
  )
 
  alcohol_top_and_bottom5 <- get_alcohol_top_and_bottom5(data = alcohol_hospitals,
                                                     input = input)
  
  #Get data for percentage diff in alcohol hospital admissions
  patients <- get_patient_data(data = alcohol_hospitals)
  
  get_filtered_plot <- filter_comparison_plot(data = patients, input = input)
  
  
  
  # Get Alcohol Time data 
 alcohol_time_data <- get_alcohol_time_data(alcohol_hospitals, input)
 
 # Get Alcohol tabs
 
 output$alcohol_consumption_percentage_diff<- plot_alcohol_data(data = get_filtered_plot)
 output$alcohol_time_plot <- get_time_alcohol_plot(data = alcohol_time_data)
}
