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
              box(title = "Map",
                  width = 8,
                  leafletOutput("map", width = "100%", height = "100%")),
              box(title = "Select Variable", width = 4,
                  "inputs")
            ),
            fluidRow(
              box(title = "Select Year",
                  width = 12,
                  "year select")
            )

    ),
    #Second Tab
    tabItem(tabName = "life_expectancy",
            fluidRow(
<<<<<<< HEAD
              box(title = "Select Variables", 
                  width = 12,
                  radioButtons(choices_sex, choices = c("Male", "Female", "Both")),
                  selectInput(council_name_choices, choices = ),
                  selectInput(deprivation_input, choices = )
=======
              box(title = "Select Variables",
                  width = 12
>>>>>>> 85b9bc8392e59e5fb77043d61a95a1203c711ee3
                  )

            ),

            # box(title = "Histogram box title",
            #     status = "warning", solidHeader = TRUE, collapsible = TRUE,
            #     plotOutput("plot", height = 250)
            # )

            fluidRow(
              box(title = "Life Expectancy Over Time",
                  width = 6,
                  plotOutput("life_expectancy_time")
              ),

              box(title = "Difference From Mean",
                  width = 6,
                  plotOutput("life_expectancy_comparison")
              )
            ),

            fluidRow(box(title = "Top 5 Councils",
                         width = 6,
                         DTOutput(
                           "top_five"
                         )
                         ),
                     box(title = "Bottom 5 Councils",
                         width = 6,
                         DTOutput(
                           "bottom_five"
                         )))
            )
  )
  )
)
