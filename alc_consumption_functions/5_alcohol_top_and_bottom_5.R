get_alcohol_top_and_bottom5 <- function(data,input){
reactive({
  req(input$select_alcohol_year)
  data %>% 
  filter(str_detect(type_of_hospital, "All"),
         alcohol_condition == "All alcohol conditions",
         alcohol_related_hospital_activity == "Patients" ) %>% 
    select(year, council_name, value) %>% 
    rename(number_of_patients = value) %>% 
    arrange(year, council_name) %>% 
    group_by(council_name) %>% 
    mutate(year_before = lag(number_of_patients)) %>% 
    drop_na(year_before) %>% 
    mutate(difference_from_previous_year = number_of_patients - year_before) %>% 
    mutate(percentage_increase = round((difference_from_previous_year/number_of_patients) *100, 2)) %>% 
    ungroup() %>% 
    filter(year == input$select_alcohol_year) %>% 
    arrange(percentage_increase) %>% 
    dplyr::slice(c(1:5,(n()-4): n())) %>% 
    distinct(council_name) %>% 
    pull
}
)
}