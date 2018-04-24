require(shiny)

ui <- fluidPage(
  title = 'Custom regression',
  sidebarLayout( # Sidebar for datainputs
    sidebarPanel(
      helpText(),
      selectInput('x', 'Build a regression of sepal length against:',
                  choices = names(iris)[-1]) # Creates box of inputs to choose from
    ),
    mainPanel(
      plotOutput('regPlot') #add in comma for verbatim text
      #verbatimTextOutput("text")
    )
  )
)

server <- function(input, output) {
  
  regFormula <- reactive({
    as.formula(paste('Sepal.Length ~', input$x)) # Creates text for formula eqn
  })
  
  output$regPlot <- renderPlot({
    par(mar = c(4, 4, .1, .1)) # Window margins for plot
    plot(regFormula(), data = iris, pch = 19) # Reads in formula, scatterplot
    #abline(lm(regFormula(), data = iris)) # Creates data-specific regression line
    '/
    output$text <- renderText({
      paste("y = ",
            lm(regFormula(), data = iris)$coef[2],
            "x + ",
            lm(regFormula(), data = iris)$coef[1],
            " (R^2 = ",
            summary(lm(regFormula(), data = iris))$r.squared,
            ")",
            sep = "")
    })
    ' 
  })
}

shinyApp(ui = ui, server = server)
