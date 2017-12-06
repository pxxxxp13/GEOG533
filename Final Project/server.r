# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  url = "dataafter.csv"
  dfnew <- read.csv(url)
  price <- dfnew$Price
  floorarea <- dfnew$Floorarea
  datasetInput <- reactive({
    switch(input$dfnew,
      "multiple" = dfnew)
      
  })
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  formulaText <- reactive({
    paste("price ~", input$variable)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  output$pricePlot <- renderPlot({
    plot(as.formula(formulaText()),
        data = dfnew)
  })
  
  
}