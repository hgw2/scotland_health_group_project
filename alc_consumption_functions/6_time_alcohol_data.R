get_alcohol_time_data <- function(data, input){
 reactive(data %>%
            select(council_name, year, units, value, alcohol_condition, alcohol_related_hospital_activity, type_of_hospital) %>% 
            filter(type_of_hospital == "All",
                   alcohol_condition == "All alcohol conditions",
                   alcohol_related_hospital_activity == "Patients",
                   units == "Patients",
                   year > 1997,
                   council_name != "Scotland Wide") %>% 
            filter(council_name %in% input$select_alcohol_council)
 )
  
}