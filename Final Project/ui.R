library(shiny)
library(car)



# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("DATA For House Price Analysis"),
  
  # Sidebar layout with a input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dfnew",
                  label = "Dataset:",
                  choices = c("multiple")),
      
      # Input: Numeric entry for number of obs to view ----
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10),
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Floorarea" = "floorarea",
                    "Year" = "Years",
                    "Lotsize" = "Lotsize",
                    "Bedroom" = "Bedroom"))
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),
      
      # Output: HTML table with requested number of observations ----
      tableOutput("view"),
        
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
        
      # Output: Plot of the requested variable against mpg ----
      plotOutput("pricePlot")
        
      
    )
  )
)



