library(rsconnect)
library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("test"),
  
  sidebarLayout(
    # Side panel for controls
    sidebarPanel(
        # Copy the line below to make a text input box
        textInput("username", label = h3("input your username"), value = "Enter text..."),
        textInput("password", label = h3("input your password")),
        
        hr(),
        fluidRow(column(3, verbatimTextOutput("value")))
        
    ),
    mainPanel(
      plotlyOutput("value")
    )
  )
))
