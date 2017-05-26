# ui.R
library(shiny)
library(plotly)

shinyUI(fluidPage(
  # Add a descriptive application title
  titlePanel("Spotify Audio Features"),
  
  navbarPage("Team inflatable Pizza",
             tabPanel("Plot",
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput(inputId = "features",
                                      label = "Features:",
                                      choices = c("Danceability", "Energy", "Tempo"),
                                      selected = "Danceability")
                          
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          #give your plot a descriptive name
                          plotOutput("rolePlot")
                        )
                      )
                      
                      ),
             tabPanel("Summary"),
             tabPanel("Table"),
             tabPanel("Search", 
                      # Text input box
                      textInput("text", label = h3("Search"), value = "Enter text..."),
                      
                      # Action button
                      actionButton("action", label = "Search"),
                      
                      hr(),
                      fluidRow(column(2, verbatimTextOutput("value")))
                      
                      )
  )
))