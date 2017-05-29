library(dplyr)
library(Rspotify)

GetRecommendedYears <- function(track.id) {
  keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")
  
  track.audio.features <- getFeatures(track.id, token=keys)
  track.features <- track.audio.features %>% select(danceability, energy, tempo, loudness, speechiness, acousticness, liveness, instrumentalness)
  
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
  danceability <- c(features.2008.danceability, features.2009.danceability, features.2010.danceability, features.2011.danceability, features.2012.danceability, features.2013.danceability, features.2014.danceability, features.2015.danceability, features.2016.danceability)
  
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
  energy <- c(features.2008.energy, features.2009.energy, features.2010.energy, features.2011.energy, features.2012.energy, features.2013.energy, features.2014.energy, features.2015.energy, features.2016.energy)
  
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
  tempo <- c(features.2008.tempo, features.2009.tempo, features.2010.tempo, features.2011.tempo, features.2012.tempo, features.2013.tempo, features.2014.tempo, features.2015.tempo, features.2016.tempo)
  
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
  loudness <- c(features.2008.loudness, features.2009.loudness, features.2010.loudness, features.2011.loudness, features.2012.loudness, features.2013.loudness, features.2014.loudness, features.2015.loudness, features.2016.loudness)
  
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
  speechiness <- c(features.2008.speechiness, features.2009.speechiness, features.2010.speechiness, features.2011.speechiness, features.2012.speechiness, features.2013.speechiness, features.2014.speechiness, features.2015.speechiness, features.2016.speechiness)
  
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
  acousticness <- c(features.2008.acousticness, features.2009.acousticness, features.2010.acousticness, features.2011.acousticness, features.2012.acousticness, features.2013.acousticness, features.2014.acousticness, features.2015.acousticness, features.2016.acousticness)
  
  ## Calculate liveness averages
  features.2016.liveness <- mean(features.2016$liveness)
  features.2015.liveness <- mean(features.2015$liveness)
  features.2014.liveness <- mean(features.2014$liveness)
  features.2013.liveness <- mean(features.2013$liveness)
  features.2012.liveness <- mean(features.2012$liveness)
  features.2011.liveness <- mean(features.2011$liveness)
  features.2010.liveness <- mean(features.2010$liveness)
  features.2009.liveness <- mean(features.2009$liveness)
  features.2008.liveness <- mean(features.2008$liveness)
  liveness <- c(features.2008.liveness, features.2009.liveness, features.2010.liveness, features.2011.liveness, features.2012.liveness, features.2013.liveness, features.2014.liveness, features.2015.liveness, features.2016.liveness)
  
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
  instrumentalness <- c(features.2008.instrumentalness, features.2009.instrumentalness, features.2010.instrumentalness, features.2011.instrumentalness, features.2012.instrumentalness, features.2013.instrumentalness, features.2014.instrumentalness, features.2015.instrumentalness, features.2016.instrumentalness)
  
  year <- c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)
  
  features <- data.frame(year, danceability, energy, tempo, loudness, speechiness, acousticness, liveness, instrumentalness)
  #features.diff <- data.frame(year, danceability, energy, tempo, loudness, speechiness, acousticness, liveness, instrumentalness)
  features$danceability <- abs(track.features$danceability - features$danceability)
  features$energy <- abs(track.features$energy - features$energy)
  features$tempo <- abs(track.features$tempo - features$tempo)
  features$loudness <- abs(track.features$loudness - features$loudness)
  features$speechiness <- abs(track.features$speechiness - features$speechiness)
  features$acousticness <- abs(track.features$acousticness - features$acousticness)
  features$liveness <- abs(track.features$liveness - features$liveness)
  features$instrumentalness <- abs(track.features$instrumentalness - features$instrumentalness)
  
  least.diff.danceability <- (features %>% filter(danceability == min(danceability)) %>% select(year))[[1]]
  least.diff.energy <- (features %>% filter(energy == min(energy)) %>% select(year))[[1]]
  least.diff.tempo <- (features %>% filter(tempo == min(tempo)) %>% select(year))[[1]]
  least.diff.loudness <- (features %>% filter(loudness == min(loudness)) %>% select(year))[[1]]
  least.diff.speechiness <- (features %>% filter(speechiness == min(speechiness)) %>% select(year))[[1]]
  least.diff.acousticness <- (features %>% filter(acousticness == min(acousticness)) %>% select(year))[[1]]
  least.diff.liveness <- (features %>% filter(liveness == min(liveness)) %>% select(year))[[1]]
  least.diff.instrumentalness <- (features %>% filter(instrumentalness == min(instrumentalness)) %>% select(year))[[1]]
  
  least.diff.years <- c(least.diff.danceability, least.diff.energy, least.diff.tempo, least.diff.loudness, least.diff.speechiness, least.diff.acousticness, least.diff.liveness, least.diff.instrumentalness)
  least.diff.years.df <- data.frame(least.diff.years)
  least.diff.years.freq <- data.frame(table(least.diff.years.df %>% group_by(least.diff.years)))
  rec.years <- least.diff.years.freq %>% filter(Freq == max(Freq)) %>% select(Var1)
  colnames(rec.years) <- "year"
  features$year <- c("2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016")
  rec <- rec.years %>% left_join(features)
  return(rec)
}

