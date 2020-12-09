
  data <- reactive({
  data %>% 
    filter(year == 2011,
           sex == "Both",
           simd_quintiles == "All")
  
})