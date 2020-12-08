
library(tidyverse)
library(janitor)
library(sf)


health_survey <- read_csv("../raw_data/scotland_health_survey_local_area.csv") %>%
  clean_names()
council_codes <- read_csv("../clean_data/council_codes_clean.csv")

health_survey <- health_survey %>%
  left_join(council_codes, by = c("feature_code" = "council_code")) %>%
  # Add Scotland wide variable
  mutate(council_name = ifelse(feature_code == "S92000003", "Scotland Wide", council_name)) %>%
  # Remove health boards
  filter(!str_detect(feature_code, "S08")) %>%
  # Remove Constituencies
  filter(!str_detect(feature_code, "S16"))




health_survey <- health_survey %>%
  # Get the last year from the window to give it a single value rather than a bin.
  separate(date_code, c("start_year", "year"), sep = "-") %>%
  select(-start_year)  %>% 
  #Remove 95% intervals
  filter(!str_detect(measurement, "95%"))



health_survey %>%
  write_csv("../clean_data/health_survey_clean.csv")
