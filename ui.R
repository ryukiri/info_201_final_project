# ui.R
library(shiny)
library(plotly)
library(knitr)

shinyUI(fluidPage(theme = "bootstrap.css",
  # Add a descriptive application title
  titlePanel("Spotify Audio Features"),
  
  navbarPage("Team inflatable Pizza",
             
             tabPanel("Plot",
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput(inputId = "features",
                                      label = "Features:",
                                      choices = c("Danceability", "Energy", "Tempo", "Loudness", "Speechiness", "Acousticness", "Liveness", "Instrumentalness"),
                                      selected = "Danceability"),
                          
                          radioButtons(inputId = "plot_types",
                                       label = "Plot Type",
                                       choices = c("Barplot", "Boxplot", "Quantile", "Violin"),
                                       selected = "Barplot")
                        ),
                        
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          #give your plot a descriptive name
                          plotOutput("rolePlot")
                        )
                      )
                      
                      
                      ),
             tabPanel("Summary"),
             tabPanel("Table", 
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput(inputId = "year",
                                      label = "Year:",
                                      choices = c("2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008"),
                                      selected = "2016")
                          
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          h2('Hot 100'),
                          dataTableOutput('tablePlot')
                        )
                      )
 
                      ),
             tabPanel("Search", 
                      # Text input box
                      textInput("text", label = h3("Search"), value = "Love Yourself"),
                      
                      # Action button
                       actionButton("action", label = "Search"),
                      
                      #submitButton("Get Recommendations", icon("refresh")),
                      #dataTableOutput('tablep'),
                      
                      hr(),
                      fluidRow(column(12, verbatimTextOutput("value")))
                      
                      )
  )
))