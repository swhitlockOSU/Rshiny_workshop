
# loads R Shiny package into R
library(shiny)

# creates user interface
ui <- fluidPage(
  sliderInput( # specifies type of input (slider bar)
    inputId = "num", # creates object name for reference in "server" function
    label = "Choose a number", # creates text label for object
    value = 25, min = 1, max = 100), # defines object characteristics
  plotOutput( # specifies type of output (plot)
    outputId = "hist") # names object
)

# establishes server commands + reactivity
server <- function(input, output){
  output$hist <- renderPlot({
    title <- "100 random normal values"	#Provides plot title text
    hist(rnorm(input$num), main = title)	#Specifies histogram structure
  })
}

shinyApp(ui,server)
