# ui.R
library(shiny)
library(plotly)
library(knitr)
library(DT)

shinyUI(fluidPage(theme = "bootstrap.css",
  # Add a descriptive application title
  titlePanel("Spotify Audio Features"),
  
  navbarPage("Team inflatable Pizza",
             
             tabPanel("About",
                      h1('About', align = 'Center'),
                      p('In this project, we have utilized data found from Billboards Annual Hot-100 charts and from past Spotify Playlists
                        to build visual representations depicting how pop music has changed since 1980. Our plots show song trends by 
                        using audio features taken from Spotify for each song. Some of these feautures include the danceability, tempo, and
                        instrumentalness of each song.'),
                      p('Our target users are people interested in music and its trends throughout the years. Because music is so universal, 
                        our users vary from a wide range of age groups and come from different backgrounds. For instance, students looking for 
                        new music and adults interested in music trends are both users we are trying to serve. Responding to the need of our 
                        target users, our dataset not only allows them to understand the progression of Billboard music trends throughout years, 
                        but also gives song recommendations based on their favorite music through the Spotify API.'),
                      p('Users will be able to find song recommendations under our \"Search\" page. It will take in a song, and then display 
                        a list of 10 chosen based off the audio features of the given song. It will also display a table of year recommendaions
                        based off of these audio features.'),
                      p('The \"Table\" page will provide users the ability to find and view the song charts we used dating back to 1080.'),
                      h3('Our Team', align = 'Center'),
                      
                      img(src="Group.jpg", width = 1000, style="display: block; margin-left: auto; margin-right: auto;")
                      
                      ),
             
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
                                       selected = "Barplot"),
                          width = 2
                        ),
                        
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          #give your plot a descriptive name
                          plotlyOutput("rolePlot")
                        )
                      )
                      
                      
                      ),

             tabPanel("Table", 
                      sidebarLayout(
                        sidebarPanel(
                          
                          selectInput(inputId = "year",
                                      label = "Year:",
                                      choices = c("2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005",
                                                  "2004", "2003", "2002", "2001", "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993",
                                                  "1992", "1991", "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981", "1980"),
                                      selected = "2016"),
                          width = 2
                          
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
                      h2('Year Recommendations'),
                      dataTableOutput('table'),
                      h2('Top 10 Song Recommendations'),
                      dataTableOutput('tablep'),
                      
                      hr(),
                      fluidRow(column(12, verbatimTextOutput("value")))
                      
                      )
  )
))