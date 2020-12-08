library(tidyverse)
library(sf)
library(janitor)


# Use 2017 dataset as it contains lat and long information 
council<- st_read("../raw_data/council_areas/Local_Authority_Districts__December_2017__Boundaries_GB_BUC.shp")

council_shp <- council %>% 
  clean_names() %>% 
  filter(str_detect(lad17cd, "S")) %>% 
  select( lad17cd, lad17nm,long, lat, geometry) %>% 
  rename(council_code = lad17cd,
         council_name = lad17nm ) %>% 
  #Replace with up to date code from 2020 file
  mutate(council_code = recode(council_code, 
                               "S12000015" = "S12000047",
                               "S12000024" = "S12000048",
                               "S12000046" = "S12000049",
                               "S12000044" = "S12000050")
  )

council_codes <- as_tibble(council_shp) %>% 
  select(-geometry)

council_codes %>% 
    write_csv("../clean_data/council_codes_clean.csv")

council_shp %>% 
  st_write("../clean_data/council_code_shape_files/", "council_codes_geom.shp", driver = "ESRI Shapefile")