source("overview_functions/get_scotland_mean.R")

council_locs <- st_read("clean_data/council_code_shape_files/council_codes_geom.shp")

map_data <- function(data){
  
  
  scotland_mean <- scotland_wide_data(data)
  data <- data %>% 
    filter(council_name != "Scotland Wide",
           sex == "Both",
           year == 2011,
           simd_quintiles == "All") %>%
    left_join(scotland_mean) %>% 
    mutate(difference_from_mean = life_expectancy - national_life_expectancy) %>% 
    arrange(council_name)
  
  data %>% 
    left_join(council_locs, by =  c("council_name" = "cncl_nm" )) %>% 
    st_as_sf()%>% 
    st_transform("+init=epsg:4326")
  
}