# ui.R
library(shiny)
library(plotly)

shinyUI(fluidPage(
  # Add a descriptive application title
  titlePanel("Spotify Audio Features"),
  
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
))