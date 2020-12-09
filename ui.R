dashboardPage(
  dashboardHeader(title = "Scotland Health"),
  dashboardSidebar( sidebarMenu(
    menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
    menuItem("Life Expectancy", tabName = "life_expectancy", icon = icon("th"))
  )
  ),
  dashboardBody(
    tabItems(
    #First tab
    tabItem(tabName = "overview",
            fluidRow(
              box( 
                tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
                  width = 12,
                  leafletOutput("map"),
              fixedPanel(top = 100, right = 50, left = 900,
                  selectInput("variable",
                              "Select Variable",
                              choices = c("Life Expectancy", "Alcohol Related Hospital Admission"),
                              selected = "Life Expectancy")),
             absolutePanel(
                        bottom = 0,
                        right = 20,
                        left = 20,
                            tags$style(".irs-bar {",
                                               "  border-color: transparent;",
                                               "  background-color: transparent;",
                                               "}",
                                               ".irs-bar-edge {",
                                               "  border-color: transparent;",
                                               "  background-color: transparent;",
                                               "}"),
                            sliderInput("year",
                                        "Select year",
                                        value = 2017,
                                        max = 2017, min = 1993,
                                        sep = "", 
                                        ticks = TRUE
                            )
                            )
            )),
           
      
    ),
    #Second Tab
    tabItem(tabName = "life_expectancy",
            fluidRow(
              box(title = "Select Variables", 
                  width = 12
                  )
              
            ),
            fluidRow(
              box(title = "Difference From Mean",
                  width = 6),
              box(title = "Life Expectancy Over Time",
                  width = 6)
              ),
            fluidRow(box(title = "Top 5 Councils",
                         width = 6),
                     box(title = "Bottom 5 Councils",
                         width = 6))
            )
  )
  )
)