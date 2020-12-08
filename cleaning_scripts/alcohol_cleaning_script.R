
library(tidyverse)
library(janitor)
library(sf)


alcohol <- read_csv("../raw_data/alcohol_hospital_admissions_data.csv") %>%
  clean_names()

council_codes <- read_csv("../clean_data/council_codes_clean.csv")

alcohol <- alcohol %>%
  left_join(council_codes, by = c("feature_code" = "council_code")) %>%
  # Add Scotland wide variable
  mutate(council_name = ifelse(feature_code == "S92000003", "Scotland Wide", council_name)) %>%
  # Remove health boards
  filter(!str_detect(feature_code, "S08")) %>%
  # Remove Constituencies
  filter(!str_detect(feature_code, "S16"))



# Remove redundant columns and separate the year 
alcohol <-alcohol %>%
  filter(measurement == "Count") %>% 
  separate(date_code, c("start_year", "year"), sep = "/") %>%
  select(-measurement, -start_year)


alcohol %>%
  write_csv("../clean_data/alcohol_hospitals_data_clean.csv")
