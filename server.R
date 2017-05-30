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
  songs.1994 <- read.csv("Songs/Songs - 1994.csv")
  songs.1993 <- read.csv("Songs/Songs - 1993.csv")
  songs.1992 <- read.csv("Songs/Songs - 1992.csv")
  songs.1991 <- read.csv("Songs/Songs - 1991.csv")
  songs.1990 <- read.csv("Songs/Songs - 1990.csv")
  songs.1989 <- read.csv("Songs/Songs - 1989.csv")
  songs.1988 <- read.csv("Songs/Songs - 1988.csv")
  songs.1987 <- read.csv("Songs/Songs - 1987.csv")
  songs.1986 <- read.csv("Songs/Songs - 1986.csv")
  songs.1985 <- read.csv("Songs/Songs - 1985.csv")
  songs.1984 <- read.csv("Songs/Songs - 1984.csv")
  songs.1983 <- read.csv("Songs/Songs - 1983.csv")
  songs.1982 <- read.csv("Songs/Songs - 1982.csv")
  songs.1981 <- read.csv("Songs/Songs - 1981.csv")
  songs.1980 <- read.csv("Songs/Songs - 1980.csv")
  
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

  ## Get all the features for hte years nad put them into data frame (import all the csv file in "features" folder)
  temp = list.files(path = paste0(getwd(), '/features'),pattern="*.csv", full.names = TRUE)
  list2env(
    lapply(setNames(temp, make.names(gsub("*.csv", "", gsub(paste0(getwd(), '/features'), "", temp) ))), 
           read.csv), envir = .GlobalEnv)
  
  
  ## all the features and years list
  all.features <- list(
    'X.features.1980' = X.features.1980,
    'X.features.1981' = X.features.1981,
    'X.features.1982' = X.features.1982,
    'X.features.1983' = X.features.1983,
    'X.features.1984' = X.features.1984,
    'X.features.1985' = X.features.1985,
    'X.features.1986' = X.features.1986,
    'X.features.1987' = X.features.1987,
    'X.features.1988' = X.features.1988,
    'X.features.1989' = X.features.1989,
    'X.features.1990' = X.features.1990,
    'X.features.1991' = X.features.1991,
    'X.features.1992' = X.features.1992,
    'X.features.1993' = X.features.1993,
    'X.features.1994' = X.features.1994,
    'X.features.1995' = X.features.1995,
    'X.features.1996' = X.features.1996,
    'X.features.1997' = X.features.1997,
    'X.features.1998' = X.features.1998,
    'X.features.1999' = X.features.1999,
    'X.features.2000' = X.features.2000,
    'X.features.2001' = X.features.2001,
    'X.features.2002' = X.features.2002,
    'X.features.2003' = X.features.2003,
    'X.features.2004' = X.features.2004,
    'X.features.2005' = X.features.2005,
    'X.features.2006' = X.features.2006,
    'X.features.2007' = X.features.2007,
    'X.features.2008' = X.features.2008,
    'X.features.2009' = X.features.2009,
    'X.features.2010' = X.features.2010,
    'X.features.2011' = X.features.2011,
    'X.features.2012' = X.features.2012,
    'X.features.2013' = X.features.2013,
    'X.features.2014' = X.features.2014,
    'X.features.2015' = X.features.2015,
    'X.features.2016' = X.features.2016
  )
  
  ## Merge them into one for use in some graphs
  features.all.songs <- read.csv("songsMerged/songs.merged.all.csv")
  

  ## Calculate danceability averages
  features.2016.danceability <- mean(X.features.2016$danceability)
  features.2015.danceability <- mean(X.features.2015$danceability)
  features.2014.danceability <- mean(X.features.2014$danceability)
  features.2013.danceability <- mean(X.features.2013$danceability)
  features.2012.danceability <- mean(X.features.2012$danceability)
  features.2011.danceability <- mean(X.features.2011$danceability)
  features.2010.danceability <- mean(X.features.2010$danceability)
  features.2009.danceability <- mean(X.features.2009$danceability)
  features.2008.danceability <- mean(X.features.2008$danceability)
  features.2007.danceability <- mean(X.features.2007$danceability)
  features.2006.danceability <- mean(X.features.2006$danceability)
  features.2005.danceability <- mean(X.features.2005$danceability)
  features.2004.danceability <- mean(X.features.2004$danceability)
  features.2003.danceability <- mean(X.features.2003$danceability)
  features.2002.danceability <- mean(X.features.2002$danceability)
  features.2001.danceability <- mean(X.features.2001$danceability)
  features.2000.danceability <- mean(X.features.2000$danceability)
  features.1999.danceability <- mean(X.features.1999$danceability)
  features.1998.danceability <- mean(X.features.1998$danceability)
  features.1997.danceability <- mean(X.features.1997$danceability)
  features.1996.danceability <- mean(X.features.1996$danceability)
  features.1995.danceability <- mean(X.features.1995$danceability)
  features.1994.danceability <- mean(X.features.1994$danceability)
  features.1993.danceability <- mean(X.features.1993$danceability)
  features.1992.danceability <- mean(X.features.1992$danceability)
  features.1991.danceability <- mean(X.features.1991$danceability)
  features.1990.danceability <- mean(X.features.1990$danceability)
  features.1989.danceability <- mean(X.features.1989$danceability)
  features.1988.danceability <- mean(X.features.1988$danceability)
  features.1987.danceability <- mean(X.features.1987$danceability)
  features.1986.danceability <- mean(X.features.1986$danceability)
  features.1985.danceability <- mean(X.features.1985$danceability)
  features.1984.danceability <- mean(X.features.1984$danceability)
  features.1983.danceability <- mean(X.features.1983$danceability)
  features.1982.danceability <- mean(X.features.1982$danceability)
  features.1981.danceability <- mean(X.features.1981$danceability)
  features.1980.danceability <- mean(X.features.1980$danceability)

  
  ## Calculate energy averages
  features.2016.energy <- mean(X.features.2016$energy)
  features.2015.energy <- mean(X.features.2015$energy)
  features.2014.energy <- mean(X.features.2014$energy)
  features.2013.energy <- mean(X.features.2013$energy)
  features.2012.energy <- mean(X.features.2012$energy)
  features.2011.energy <- mean(X.features.2011$energy)
  features.2010.energy <- mean(X.features.2010$energy)
  features.2009.energy <- mean(X.features.2009$energy)
  features.2008.energy <- mean(X.features.2008$energy)
  
  ## Calculate tempo averages
  features.2016.tempo <- mean(X.features.2016$tempo)
  features.2015.tempo <- mean(X.features.2015$tempo)
  features.2014.tempo <- mean(X.features.2014$tempo)
  features.2013.tempo <- mean(X.features.2013$tempo)
  features.2012.tempo <- mean(X.features.2012$tempo)
  features.2011.tempo <- mean(X.features.2011$tempo)
  features.2010.tempo <- mean(X.features.2010$tempo)
  features.2009.tempo <- mean(X.features.2009$tempo)
  features.2008.tempo <- mean(X.features.2008$tempo)
  
  ## Calculate loudness averages
  features.2016.loudness <- mean(X.features.2016$loudness)
  features.2015.loudness <- mean(X.features.2015$loudness)
  features.2014.loudness <- mean(X.features.2014$loudness)
  features.2013.loudness <- mean(X.features.2013$loudness)
  features.2012.loudness <- mean(X.features.2012$loudness)
  features.2011.loudness <- mean(X.features.2011$loudness)
  features.2010.loudness <- mean(X.features.2010$loudness)
  features.2009.loudness <- mean(X.features.2009$loudness)
  features.2008.loudness <- mean(X.features.2008$loudness)
  
  ## Calculate speechiness averages
  features.2016.speechiness <- mean(X.features.2016$speechiness)
  features.2015.speechiness <- mean(X.features.2015$speechiness)
  features.2014.speechiness <- mean(X.features.2014$speechiness)
  features.2013.speechiness <- mean(X.features.2013$speechiness)
  features.2012.speechiness <- mean(X.features.2012$speechiness)
  features.2011.speechiness <- mean(X.features.2011$speechiness)
  features.2010.speechiness <- mean(X.features.2010$speechiness)
  features.2009.speechiness <- mean(X.features.2009$speechiness)
  features.2008.speechiness <- mean(X.features.2008$speechiness)
  
  ## Calculate acousticness averages
  features.2016.acousticness <- mean(X.features.2016$acousticness)
  features.2015.acousticness <- mean(X.features.2015$acousticness)
  features.2014.acousticness <- mean(X.features.2014$acousticness)
  features.2013.acousticness <- mean(X.features.2013$acousticness)
  features.2012.acousticness <- mean(X.features.2012$acousticness)
  features.2011.acousticness <- mean(X.features.2011$acousticness)
  features.2010.acousticness <- mean(X.features.2010$acousticness)
  features.2009.acousticness <- mean(X.features.2009$acousticness)
  features.2008.acousticness <- mean(X.features.2008$acousticness)
  
  ## Calculate acousticness averages
  features.2016.liveness <- mean(X.features.2016$liveness)
  features.2015.liveness <- mean(X.features.2015$liveness)
  features.2014.liveness <- mean(X.features.2014$liveness)
  features.2013.liveness <- mean(X.features.2013$liveness)
  features.2012.liveness <- mean(X.features.2012$liveness)
  features.2011.liveness <- mean(X.features.2011$liveness)
  features.2010.liveness <- mean(X.features.2010$liveness)
  features.2009.liveness <- mean(X.features.2009$liveness)
  features.2008.liveness <- mean(X.features.2008$liveness)
  
  ## Calculate instrumentalness averages
  features.2016.instrumentalness <- mean(X.features.2016$instrumentalness)
  features.2015.instrumentalness <- mean(X.features.2015$instrumentalness)
  features.2014.instrumentalness <- mean(X.features.2014$instrumentalness)
  features.2013.instrumentalness <- mean(X.features.2013$instrumentalness)
  features.2012.instrumentalness <- mean(X.features.2012$instrumentalness)
  features.2011.instrumentalness <- mean(X.features.2011$instrumentalness)
  features.2010.instrumentalness <- mean(X.features.2010$instrumentalness)
  features.2009.instrumentalness <- mean(X.features.2009$instrumentalness)
  features.2008.instrumentalness <- mean(X.features.2008$instrumentalness)

    # Select audio features to show
    if(input$features == "Danceability") {
        dat <- data.frame(
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.1980.danceability,
                         features.1981.danceability,
                         features.1982.danceability,
                         features.1983.danceability,
                         features.1984.danceability,
                         features.1985.danceability,
                         features.1986.danceability,
                         features.1987.danceability,
                         features.1988.danceability,
                         features.1989.danceability,
                         features.1990.danceability,
                         features.1991.danceability,
                         features.1992.danceability,
                         features.1993.danceability,
                         features.1994.danceability,
                         features.1995.danceability,
                         features.1996.danceability,
                         features.1997.danceability,
                         features.1998.danceability,
                         features.1999.danceability,
                         features.2000.danceability,
                         features.2001.danceability,
                         features.2002.danceability,
                         features.2003.danceability,
                         features.2004.danceability,
                         features.2005.danceability,
                         features.2006.danceability,
                         features.2007.danceability,
                         features.2008.danceability,
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
    merged.2007 <- read.csv("songsMerged/songs.merged.2007.csv")
    merged.2006 <- read.csv("songsMerged/songs.merged.2006.csv")
    merged.2005 <- read.csv("songsMerged/songs.merged.2005.csv")
    merged.2004 <- read.csv("songsMerged/songs.merged.2004.csv")
    merged.2003 <- read.csv("songsMerged/songs.merged.2003.csv")
    merged.2002 <- read.csv("songsMerged/songs.merged.2002.csv")
    merged.2001 <- read.csv("songsMerged/songs.merged.2001.csv")
    merged.2000 <- read.csv("songsMerged/songs.merged.2000.csv")
    merged.1999 <- read.csv("songsMerged/songs.merged.1999.csv")
    merged.1998 <- read.csv("songsMerged/songs.merged.1998.csv")
    merged.1997 <- read.csv("songsMerged/songs.merged.1997.csv")
    merged.1996 <- read.csv("songsMerged/songs.merged.1996.csv")
    merged.1995 <- read.csv("songsMerged/songs.merged.1995.csv")
    merged.1994 <- read.csv("songsMerged/songs.merged.1994.csv")
    merged.1993 <- read.csv("songsMerged/songs.merged.1993.csv")
    merged.1992 <- read.csv("songsMerged/songs.merged.1992.csv")
    merged.1991 <- read.csv("songsMerged/songs.merged.1991.csv")
    merged.1990 <- read.csv("songsMerged/songs.merged.1990.csv")
    merged.1989 <- read.csv("songsMerged/songs.merged.1989.csv")
    merged.1988 <- read.csv("songsMerged/songs.merged.1988.csv")
    merged.1987 <- read.csv("songsMerged/songs.merged.1987.csv")
    merged.1986 <- read.csv("songsMerged/songs.merged.1986.csv")
    merged.1985 <- read.csv("songsMerged/songs.merged.1985.csv")
    merged.1984 <- read.csv("songsMerged/songs.merged.1984.csv")
    merged.1983 <- read.csv("songsMerged/songs.merged.1983.csv")
    merged.1982 <- read.csv("songsMerged/songs.merged.1982.csv")
    merged.1981 <- read.csv("songsMerged/songs.merged.1981.csv")
    merged.1980 <- read.csv("songsMerged/songs.merged.1980.csv")
    
    
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
    } else if(input$year == "2007") {
      merged.2007
    } else if(input$year == "2006") {
      merged.2006
    } else if(input$year == "2005") {
      merged.2005
    } else if(input$year == "2004") {
      merged.2004
    } else if(input$year == "2003") {
      merged.2003
    } else if(input$year == "2002") {
      merged.2002
    } else if(input$year == "2001") {
      merged.2001
    } else if(input$year == "2000") {
      merged.2000
    } else if(input$year == "1999") {
      merged.1999
    } else if(input$year == "1998") {
      merged.1998
    } else if(input$year == "1997") {
      merged.1997
    } else if(input$year == "1996") {
      merged.1996
    } else if(input$year == "1995") {
      merged.1995
    } else if(input$year == "1994") {
      merged.1994
    } else if(input$year == "1993") {
      merged.1993
    } else if(input$year == "1992") {
      merged.1992
    } else if(input$year == "1991") {
      merged.1991
    } else if(input$year == "1990") {
      merged.1990
    } else if(input$year == "1989") {
      merged.1989
    } else if(input$year == "1988") {
      merged.1988
    } else if(input$year == "1987") {
      merged.1987
    } else if(input$year == "1986") {
      merged.1986
    } else if(input$year == "1985") {
      merged.1985
    } else if(input$year == "1984") {
      merged.1984
    } else if(input$year == "1983") {
      merged.1983
    } else if(input$year == "1982") {
      merged.1982
    } else if(input$year == "1981") {
      merged.1981
    } else if(input$year == "1980") {
      merged.1980
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
