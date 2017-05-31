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
             
             tabPanel("Analysis",
                      h2('Introduction and Data Observation', align = 'Center'),
                      p(' '),
                      p('Our dataset not only allows users to understand the progression of Billboard music trends throughout years, but also 
                        gives song recommendations based on their favorite music through the Spotify API. '),
                      p('To begin with, our dataset portrayed in plots allows them to understand the development of different audio features of 
                        Billboard top 100 songs from 1980 to 2016. There are four types of plots including Barplot, Boxplot, Quantile and Violin 
                        that enable users to comprehensively approach and understand music trends. '),
                      p('The music features we include throughout the years are Danceability, Energy, Tempo, Loudness, Speechiness, Acousticness,
                        Liveness and Instrumentalness. There are some trends and patterns from 1980 to 2016 that we have observed in these features.
                        The Danceability, Energy and Tempo features slightly vary throughout the years, but they mostly stay consistent around 0.6 
                        for Danceability, 0.58 for Energy and 115 for Tempo. Interestingly, in recent years dated from 2010, the energy is going 
                        down while the danceability is slowly rising up. There are also regressional and obvious patterns in some of the other features.
                        In overall, the loudness is gradually increasing throughout the years. This can reflect a preference of people nowadays to 
                        more up-hype and high-volume music compared to those of 1980. '),
                      img(src="loudness.jpeg", width = 1000, style="display: block; margin-left: auto; margin-right: auto;"),
                      p('The Speechiness has gone up from 1980, reaching a peak in 2003. It then dropped a bit but has been on the rise again since 2014.'),
                      img(src="speechiness.jpeg", width = 1000, style="display: block; margin-left: auto; margin-right: auto;"),
                      p('From looking at the Quantile plot, we can see that Instrumentalness has been steadily decreasing since 1980. The increase we 
                        see in Speechiness and the decrease in Instrumentalness may be due to the rise in popularity of rap music.'),
                      img(src="instrumentalness.jpeg", width = 1000, style="display: block; margin-left: auto; margin-right: auto;"),
                      p('Acousticness has varied throughout the years, but has been dropping in general. Liveness has also varied throughout the years 
                        but has stayed pretty consistent overall. Song length peaked around 1992 and has been slowly dropping since.'),
                      p('In addition, there is also a personalized functionality achieved through our website in that users can get 10 song 
                        recommendations by inputting the title of their favorite song.')
                      
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