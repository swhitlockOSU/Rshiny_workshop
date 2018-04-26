library(shiny)
library(shinydashboard)


shinyApp(
  ui = dashboardPage(
    dashboardHeader(title = "tabBoxes"),
    dashboardSidebar(),
    body()
  ),
  server = function(input, output) {
    # The currently selected tab from the first box
    output$tabset1Selected <- renderText({
      input$tabset1
    })
  }
)