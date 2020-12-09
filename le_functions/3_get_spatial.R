council_locs <- st_read("clean_data/council_code_shape_files/council_codes_geom.shp")

get_spatial <- function(council, scotland){
  reactive(council() %>% 
    left_join(scotland()) %>% 
    mutate(difference_from_mean = life_expectancy - national_life_expectancy,
           over_mean = difference_from_mean > 0) %>% 
      mutate(over_mean = factor(over_mean, levels = c("TRUE", "FALSE"))) %>% 
    arrange(council_name) %>% 
    left_join(council_locs, by =  c("council_name" = "cncl_nm" )) %>% 
    st_as_sf() %>% 
    st_transform("+init=epsg:4326")
  )
  
}