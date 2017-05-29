# server.R
library(devtools)
library(Rspotify)
library(dplyr)
library(knitr)
library(DT)

shinyServer(function(input, output) {
  ## Authorizes Spotify API with keys
  keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")
  source("functions/GetSongData.R")
  source("functions/Combine.features.by.year.R")
  source("functions/GetTrackID.R")
  source("functions/GetRecommendations.R")
  source("functions/GetRecommendedYears.R")
  
  output$rolePlot <- renderPlot({
  
  ## Read in songs for each year
 
  songs.2015 <- read.csv("Songs/Songs - 2015.csv")
  songs.2014 <- read.csv("Songs/Songs - 2014.csv")
  songs.2013 <- read.csv("Songs/Songs - 2013.csv")
  songs.2012 <- read.csv("Songs/Songs - 2012.csv")
  songs.2011 <- read.csv("Songs/Songs - 2011.csv")
  songs.2010 <- read.csv("Songs/Songs - 2010.csv")
  songs.2009 <- read.csv("Songs/Songs - 2009.csv")
  songs.2008 <- read.csv("Songs/Songs - 2008.csv")
  songs.2007 <- read.csv("Songs/Songs - 2007.csv")
  songs.2006 <- read.csv("Songs/Songs - 2006.csv")
  songs.2005 <- read.csv("Songs/Songs - 2005.csv")
  songs.2004 <- read.csv("Songs/Songs - 2004.csv")
  songs.2003 <- read.csv("Songs/Songs - 2003.csv")
  songs.2002 <- read.csv("Songs/Songs - 2002.csv")
  songs.2001 <- read.csv("Songs/Songs - 2001.csv")
  songs.2000 <- read.csv("Songs/Songs - 2000.csv")
  songs.1999 <- read.csv("Songs/Songs - 1999.csv")
  songs.1998 <- read.csv("Songs/Songs - 1998.csv")
  songs.1997 <- read.csv("Songs/Songs - 1997.csv")
  songs.1996 <- read.csv("Songs/Songs - 1996.csv")
  songs.1995 <- read.csv("Songs/Songs - 1995.csv")
  
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
  
  ## all the features and years list
  all.features <- list(
      'features.2008' = features.2008,
      'features.2009' = features.2009,
      'features.2010' = features.2010,
      'features.2011' = features.2011,
      'features.2012' = features.2012,
      'features.2013' = features.2013,
      'features.2014' = features.2014,
      'features.2015' = features.2015,
      'features.2016' = features.2016
  )
  
  ## Merge them into one for use in some graphs
  features.all.songs <- read.csv("songsMerged/songs.merged.all.csv")
  

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
  
  ## Calculate loudness averages
  features.2016.loudness <- mean(features.2016$loudness)
  features.2015.loudness <- mean(features.2015$loudness)
  features.2014.loudness <- mean(features.2014$loudness)
  features.2013.loudness <- mean(features.2013$loudness)
  features.2012.loudness <- mean(features.2012$loudness)
  features.2011.loudness <- mean(features.2011$loudness)
  features.2010.loudness <- mean(features.2010$loudness)
  features.2009.loudness <- mean(features.2009$loudness)
  features.2008.loudness <- mean(features.2008$loudness)
  
  ## Calculate speechiness averages
  features.2016.speechiness <- mean(features.2016$speechiness)
  features.2015.speechiness <- mean(features.2015$speechiness)
  features.2014.speechiness <- mean(features.2014$speechiness)
  features.2013.speechiness <- mean(features.2013$speechiness)
  features.2012.speechiness <- mean(features.2012$speechiness)
  features.2011.speechiness <- mean(features.2011$speechiness)
  features.2010.speechiness <- mean(features.2010$speechiness)
  features.2009.speechiness <- mean(features.2009$speechiness)
  features.2008.speechiness <- mean(features.2008$speechiness)
  
  ## Calculate acousticness averages
  features.2016.acousticness <- mean(features.2016$acousticness)
  features.2015.acousticness <- mean(features.2015$acousticness)
  features.2014.acousticness <- mean(features.2014$acousticness)
  features.2013.acousticness <- mean(features.2013$acousticness)
  features.2012.acousticness <- mean(features.2012$acousticness)
  features.2011.acousticness <- mean(features.2011$acousticness)
  features.2010.acousticness <- mean(features.2010$acousticness)
  features.2009.acousticness <- mean(features.2009$acousticness)
  features.2008.acousticness <- mean(features.2008$acousticness)
  
  ## Calculate acousticness averages
  features.2016.liveness <- mean(features.2016$liveness)
  features.2015.liveness <- mean(features.2015$liveness)
  features.2014.liveness <- mean(features.2014$liveness)
  features.2013.liveness <- mean(features.2013$liveness)
  features.2012.liveness <- mean(features.2012$liveness)
  features.2011.liveness <- mean(features.2011$liveness)
  features.2010.liveness <- mean(features.2010$liveness)
  features.2009.liveness <- mean(features.2009$liveness)
  features.2008.liveness <- mean(features.2008$liveness)
  
  ## Calculate instrumentalness averages
  features.2016.instrumentalness <- mean(features.2016$instrumentalness)
  features.2015.instrumentalness <- mean(features.2015$instrumentalness)
  features.2014.instrumentalness <- mean(features.2014$instrumentalness)
  features.2013.instrumentalness <- mean(features.2013$instrumentalness)
  features.2012.instrumentalness <- mean(features.2012$instrumentalness)
  features.2011.instrumentalness <- mean(features.2011$instrumentalness)
  features.2010.instrumentalness <- mean(features.2010$instrumentalness)
  features.2009.instrumentalness <- mean(features.2009$instrumentalness)
  features.2008.instrumentalness <- mean(features.2008$instrumentalness)

    # Select audio features to show
    if(input$features == "Danceability") {
        dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.danceability,
                         features.2009.danceability,
                         features.2010.danceability,
                         features.2011.danceability,
                         features.2012.danceability,
                         features.2013.danceability,
                         features.2014.danceability,
                         features.2015.danceability,
                         features.2016.danceability))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'danceability'))
        feature.years <- features.all.songs%>%select(feature = danceability, Year)
    } else if(input$features == "Energy"){
        dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.energy,
                         features.2009.energy,
                         features.2010.energy,
                         features.2011.energy,
                         features.2012.energy,
                         features.2013.energy,
                         features.2014.energy,
                         features.2015.energy,
                         features.2016.energy))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'energy'))
        feature.years <- features.all.songs%>%select(feature = energy, Year)
        
    } else if(input$features == "Tempo"){
        dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.tempo,
                         features.2009.tempo,
                         features.2010.tempo,
                         features.2011.tempo,
                         features.2012.tempo,
                         features.2013.tempo,
                         features.2014.tempo,
                         features.2015.tempo,
                         features.2016.tempo))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'tempo'))
        feature.years <- features.all.songs%>%select(feature = tempo, Year)

    } else if(input$features == "Loudness"){
      dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.loudness,
                  features.2009.loudness,
                  features.2010.loudness,
                  features.2011.loudness,
                  features.2012.loudness,
                  features.2013.loudness,
                  features.2014.loudness,
                  features.2015.loudness,
                  features.2016.loudness))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'loudness'))
        feature.years <- features.all.songs%>%select(feature = loudness, Year)

    } else if(input$features == "Speechiness"){
      dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.speechiness,
                     features.2009.speechiness,
                     features.2010.speechiness,
                     features.2011.speechiness,
                     features.2012.speechiness,
                     features.2013.speechiness,
                     features.2014.speechiness,
                     features.2015.speechiness,
                     features.2016.speechiness))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'speechiness'))
        feature.years <- features.all.songs%>%select(feature = speechiness, Year)

    } else if(input$features == "Acousticness"){
      dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.acousticness,
                        features.2009.acousticness,
                        features.2010.acousticness,
                        features.2011.acousticness,
                        features.2012.acousticness,
                        features.2013.acousticness,
                        features.2014.acousticness,
                        features.2015.acousticness,
                        features.2016.acousticness))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'acousticness'))
        feature.years <- features.all.songs%>%select(feature = acousticness, Year)

    } else if(input$features == "Liveness"){
      dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.liveness,
                         features.2009.liveness,
                         features.2010.liveness,
                         features.2011.liveness,
                         features.2012.liveness,
                         features.2013.liveness,
                         features.2014.liveness,
                         features.2015.liveness,
                         features.2016.liveness))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'liveness'))
        feature.years <- features.all.songs%>%select(feature = liveness, Year)

    } else if(input$features == "Instrumentalness"){
      dat <- data.frame(
        year = factor(c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), levels=c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.2008.instrumentalness,
                     features.2009.instrumentalness,
                     features.2010.instrumentalness,
                     features.2011.instrumentalness,
                     features.2012.instrumentalness,
                     features.2013.instrumentalness,
                     features.2014.instrumentalness,
                     features.2015.instrumentalness,
                     features.2016.instrumentalness))
        all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'instrumentalness'))
        feature.years <- features.all.songs%>%select(feature = instrumentalness, Year)
    }
  
    if(input$plot_types == "Barplot") {
      ggplot(data=dat, aes(x=year, y=stat_average, fill=year)) +
        geom_bar(stat="identity") +
        labs(y = input$features)
    } else if(input$plot_types == "Boxplot") {
      ggplot(stack(all.years.feature[,-1]), aes(x = ind, y = values, color = ind)) +
        geom_boxplot() +
        labs(x = "Years", y = input$features, color = "Year")
    } else if(input$plot_types == "Quantile") {
      qplot(Year, feature,data = feature.years,
            xlab = 'Year', ylab = input$features,geom = c("point", "smooth"),span = 0.2,  col = Year)
    } else if(input$plot_types == "Violin") {
      ggplot(stack(all.years.feature[,-1]), aes(x = ind, y = values, color = ind)) +
        geom_violin() +
        labs(x = "Years", y = input$features, color = 'Year')
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
  
  ## Radio buttons
  output$values <- renderPrint({
     input$radio
  })
  
  ## Text field
  output$value <- renderPrint({ 
    searched.song <- input$text
    track.id <- GetTrackID(searched.song)
    recommendations <- GetRecommendations(track.id)
    output$tablep <- renderDataTable({
      datatable(recommendations, options = list(dom = 't'))
    })
  })
})
