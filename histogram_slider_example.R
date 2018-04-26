# loads R Shiny package into R
library(shiny)	

# creates user interface
ui <- fluidPage(	# Creates the simplest user-interface
  sliderInput(	# Specifies input type (slider bar)
    inputId = "num",	# Define object name for server
    label = "Choose a number", 	# Creates text label in UI
    # Define properties of the slider       
    value = 25, min = 1, max = 100),	
  plotOutput(	# Specifies output type (plot)
    outputId = "hist") 	# Creates object name
)

# Defines server function
server <- function(input, output){	
  
  output$hist <- renderPlot({ 	
    # Specifies histogram structure
    hist(rnorm(input$num),
         main = paste(input$num,
                      "random normal values")
    )	
  })
}

# launches Shiny app
shinyApp(ui = ui, server = server) 	
