
library(tidyverse)
library(janitor)
library(sf)
library(lubridate)


  life_expectancy <- read_csv("raw_data/life_expectancy.csv") %>%
  clean_names()
council_codes <- read_csv("clean_data/council_codes_clean.csv")

life_expectancy <- life_expectancy %>%
  left_join(council_codes, by = c("feature_code" = "council_code")) %>%
  # Add Scotland wide variable
  mutate(council_name = ifelse(feature_code == "S92000003", "Scotland Wide", council_name)) %>%
  # Remove health boards
  filter(!str_detect(feature_code, "S08")) %>%
  # Remove Constituencies
  filter(!str_detect(feature_code, "S16"))




life_expectancy <- life_expectancy %>%
  # Get life expectancy from birth
  filter(
    age == "0 years",
    measurement == "Count"
  ) %>%
  # Get the last year from the window to give it a single value rather than a bin.
  separate(date_code, c("start_year", "year"), sep = "-") %>%
  filter(urban_rural_classification == "All") %>% 
  select( -start_year,-measurement, -feature_code, -units, -age, -urban_rural_classification, - long, -lat) %>%
  mutate(year = as.numeric(year)) %>% 
  mutate(year = year - 1) %>% 
  rename(life_expectancy = value)

life_expectancy_sex_all <- life_expectancy %>% 
  group_by(year, simd_quintiles, council_name) %>% 
  summarise(life_expectancy = round(mean(life_expectancy), digits = 2)) %>% 
  mutate(sex = "Both")

life_expectancy_bind <- bind_rows(life_expectancy, life_expectancy_sex_all) %>% 
  arrange(council_name)

life_expectancy_bind %>%
    write_csv("clean_data/life_expectancy_clean.csv")
