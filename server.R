# server.R
library(devtools)
library(Rspotify)
library(dplyr)
library(knitr)

shinyServer(function(input, output) {
  ## Authorizes Spotify API with keys
  keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")
  source("functions/GetSongData.R")
  
  output$rolePlot <- renderPlot({
  
  ## Read in songs for each year
  songs.2016 <- read.csv("Songs/Songs - 2016.csv")
  songs.2015 <- read.csv("Songs/Songs - 2015.csv")
  songs.2014 <- read.csv("Songs/Songs - 2014.csv")
  songs.2013 <- read.csv("Songs/Songs - 2013.csv")
  songs.2012 <- read.csv("Songs/Songs - 2012.csv")
  songs.2011 <- read.csv("Songs/Songs - 2011.csv")
  songs.2010 <- read.csv("Songs/Songs - 2010.csv")
  songs.2009 <- read.csv("Songs/Songs - 2009.csv")
  songs.2008 <- read.csv("Songs/Songs - 2008.csv")

  ## Grabbing audio features for the years and putting them into respective data frames
  features.2016 <- read.csv("features/features.2016.csv")
  features.2015 <- read.csv("features/features.2015.csv")
  features.2014 <- read.csv("features/features.2014.csv")
  features.2013 <- read.csv("features/features.2013.csv")
  features.2012 <- read.csv("features/features.2012.csv")
  features.2011 <- read.csv("features/features.2011.csv")
  features.2010 <- read.csv("features/features.2010.csv")
  features.2009 <- read.csv("features/features.2009.csv")
  features.2008 <- read.csv("features/features.2008.csv")
  
  ## Calculate danceability averages
  features.2016.danceability <- mean(features.2016$danceability)
  features.2015.danceability <- mean(features.2015$danceability)
  features.2014.danceability <- mean(features.2014$danceability)
  features.2013.danceability <- mean(features.2013$danceability)
  features.2012.danceability <- mean(features.2012$danceability)
  features.2011.danceability <- mean(features.2011$danceability)
  features.2010.danceability <- mean(features.2010$danceability)
  features.2009.danceability <- mean(features.2009$danceability)
  features.2008.danceability <- mean(features.2008$danceability)
  
  ## Calculate energy averages
  features.2016.energy <- mean(features.2016$energy)
  features.2015.energy <- mean(features.2015$energy)
  features.2014.energy <- mean(features.2014$energy)
  features.2013.energy <- mean(features.2013$energy)
  features.2012.energy <- mean(features.2012$energy)
  features.2011.energy <- mean(features.2011$energy)
  features.2010.energy <- mean(features.2010$energy)
  features.2009.energy <- mean(features.2009$energy)
  features.2008.energy <- mean(features.2008$energy)
  
  ## Calculate tempo averages
  features.2016.tempo <- mean(features.2016$tempo)
  features.2015.tempo <- mean(features.2015$tempo)
  features.2014.tempo <- mean(features.2014$tempo)
  features.2013.tempo <- mean(features.2013$tempo)
  features.2012.tempo <- mean(features.2012$tempo)
  features.2011.tempo <- mean(features.2011$tempo)
  features.2010.tempo <- mean(features.2010$tempo)
  features.2009.tempo <- mean(features.2009$tempo)
  features.2008.tempo <- mean(features.2008$tempo)
  

    # Select audio features to show
    if(input$features == "Danceability") {
        dat <- data.frame(
        year = factor(c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008), levels=c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008)),
        danceability = c(features.2016.danceability,
                         features.2015.danceability,
                         features.2014.danceability,
                         features.2013.danceability,
                         features.2012.danceability,
                         features.2011.danceability,
                         features.2010.danceability,
                         features.2009.danceability,
                         features.2008.danceability))
        
        # Consturcts a bar plot
        ggplot(data=dat, aes(x=year, y=danceability, color=year)) +
          geom_bar(stat="identity")
        
    } else if(input$features == "Energy"){
        dat <- data.frame(
        year = factor(c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008), levels=c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008)),
        energy = c(features.2016.energy,
                         features.2015.energy,
                         features.2014.energy,
                         features.2013.energy,
                         features.2012.energy,
                         features.2011.energy,
                         features.2010.energy,
                         features.2009.energy,
                         features.2008.energy))
        
        # Consturcts a bar plot
        ggplot(data=dat, aes(x=year, y=energy, color=year)) +
          geom_bar(stat="identity")
        
    } else if(input$features == "Tempo"){
        dat <- data.frame(
        year = factor(c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008), levels=c(2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008)),
        tempo = c(features.2016.tempo,
                         features.2015.tempo,
                         features.2014.tempo,
                         features.2013.tempo,
                         features.2012.tempo,
                         features.2011.tempo,
                         features.2010.tempo,
                         features.2009.tempo,
                         features.2008.tempo))
        
        # Consturcts a bar plot
        ggplot(data=dat, aes(x=year, y=tempo, color=year)) +
          geom_bar(stat="identity")
    }
  })
  
  output$tablePlot <- renderDataTable({
    merged.2016 <- read.csv("songsMerged/songs.merged.2016.csv")
    merged.2015 <- read.csv("songsMerged/songs.merged.2015.csv")
    merged.2014 <- read.csv("songsMerged/songs.merged.2014.csv")
    merged.2013 <- read.csv("songsMerged/songs.merged.2013.csv")
    merged.2012 <- read.csv("songsMerged/songs.merged.2012.csv")
    merged.2011 <- read.csv("songsMerged/songs.merged.2011.csv")
    merged.2010 <- read.csv("songsMerged/songs.merged.2010.csv")
    merged.2009 <- read.csv("songsMerged/songs.merged.2009.csv")
    merged.2008 <- read.csv("songsMerged/songs.merged.2008.csv")
    
    # Select years to show
    if(input$year == "2016") {
      merged.2016
    } else if(input$year == "2015") {
      merged.2015
    } else if(input$year == "2014") {
      merged.2014
    } else if(input$year == "2013") {
      merged.2013
    } else if(input$year == "2012") {
      merged.2012
    } else if(input$year == "2011") {
      merged.2011
    } else if(input$year == "2010") {
      merged.2010
    } else if(input$year == "2009") {
      merged.2009
    } else if(input$year == "2008") {
      merged.2008
    }
  })
})