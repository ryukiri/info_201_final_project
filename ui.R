# ui.R
library(shiny)
library(plotly)
library(knitr)
library(DT)

shinyUI(fluidPage(theme = "bootstrap.css",
  # Add a descriptive application title
  titlePanel("Spotify Audio Features"),
  
  navbarPage("Team inflatable Pizza",
             
             tabPanel("Plot",
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput(inputId = "features",
                                      label = "Features:",
                                      choices = c("Danceability", "Energy", "Tempo", "Loudness", "Speechiness", "Acousticness", "Liveness", "Instrumentalness", "Song Length"),
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
                                      choices = c("2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005",
                                                  "2004", "2003", "2002", "2001", "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993",
                                                  "1992", "1991", "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981", "1980"),
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
                      
                      #submitButton("Get Recommendations"),
                      dataTableOutput('table'),
                      dataTableOutput('tablep'),
                      
                      hr(),
                      fluidRow(column(12, verbatimTextOutput("value")))
                      
                      )
  )
))