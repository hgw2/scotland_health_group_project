dashboardPage(
  dashboardHeader(title = "Scotland Health"),
  dashboardSidebar( sidebarMenu(
    menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
    menuItem("Life Expectancy", tabName = "life_expectancy", icon = icon("th"))
  )
  ),
  dashboardBody(
    #First tab
    tabItem(tabName = "overview",
            fluidRow(
              box(title = "Map", width = 8,
                  "map"),
              box(title = "Select Variable", width = 4,
                  "inputs")
            ),
            fluidRow(
              box(title = "Select Year", width = 12,
                  "year select")
            )
      
    )
  )
)