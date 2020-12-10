council_locs <- st_read("clean_data/council_code_shape_files/council_codes_geom.shp")

get_alcohol_spatial <- function(data, input){
  reactive(
    data %>% 
    left_join(council_locs, by =  c("council_name" = "cncl_nm" )) %>%
    mutate(increase_decrease = percentage_increase > 0 ) %>%
    mutate(increase_decrease = as.character(increase_decrease)) %>% 
    mutate(increase_decrease = case_when( 
      increase_decrease == "TRUE" ~ "Increase",
      increase_decrease == "FALSE" ~ "Decrease")) %>% 
    mutate(increase_decrease = factor(increase_decrease, 
                                      levels = c("Increase", "Decrease"))) %>% 
    filter(year == input$year) %>% 
    st_as_sf() %>% 
    st_transform("+init=epsg:4326")
  )
}