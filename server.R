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
  features.2007 <- read.csv("features/features.2007.csv")
  features.2006 <- read.csv("features/features.2006.csv")
  features.2005 <- read.csv("features/features.2005.csv")
  features.2004 <- read.csv("features/features.2004.csv")
  features.2003 <- read.csv("features/features.2003.csv")
  features.2002 <- read.csv("features/features.2002.csv")
  features.2001 <- read.csv("features/features.2001.csv")
  features.2000 <- read.csv("features/features.2000.csv")
  features.1999 <- read.csv("features/features.1999.csv")
  features.1998 <- read.csv("features/features.1998.csv")
  features.1997 <- read.csv("features/features.1997.csv")
  features.1996 <- read.csv("features/features.1996.csv")
  features.1995 <- read.csv("features/features.1995.csv")
  features.1994 <- read.csv("features/features.1994.csv")
  features.1993 <- read.csv("features/features.1993.csv")
  features.1992 <- read.csv("features/features.1992.csv")
  features.1991 <- read.csv("features/features.1991.csv")
  features.1990 <- read.csv("features/features.1990.csv")
  features.1989 <- read.csv("features/features.1989.csv")
  features.1988 <- read.csv("features/features.1988.csv")
  features.1987 <- read.csv("features/features.1987.csv")
  features.1986 <- read.csv("features/features.1986.csv")
  features.1985 <- read.csv("features/features.1985.csv")
  features.1984 <- read.csv("features/features.1984.csv")
  features.1983 <- read.csv("features/features.1983.csv")
  features.1982 <- read.csv("features/features.1982.csv")
  features.1981 <- read.csv("features/features.1981.csv")
  features.1980 <- read.csv("features/features.1980.csv")

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
  features.2007.energy <- mean(X.features.2007$energy)
  features.2006.energy <- mean(X.features.2006$energy)
  features.2005.energy <- mean(X.features.2005$energy)
  features.2004.energy <- mean(X.features.2004$energy)
  features.2003.energy <- mean(X.features.2003$energy)
  features.2002.energy <- mean(X.features.2002$energy)
  features.2001.energy <- mean(X.features.2001$energy)
  features.2000.energy <- mean(X.features.2000$energy)
  features.1999.energy <- mean(X.features.1999$energy)
  features.1998.energy <- mean(X.features.1998$energy)
  features.1997.energy <- mean(X.features.1997$energy)
  features.1996.energy <- mean(X.features.1996$energy)
  features.1995.energy <- mean(X.features.1995$energy)
  features.1994.energy <- mean(X.features.1994$energy)
  features.1993.energy <- mean(X.features.1993$energy)
  features.1992.energy <- mean(X.features.1992$energy)
  features.1991.energy <- mean(X.features.1991$energy)
  features.1990.energy <- mean(X.features.1990$energy)
  features.1989.energy <- mean(X.features.1989$energy)
  features.1988.energy <- mean(X.features.1988$energy)
  features.1987.energy <- mean(X.features.1987$energy)
  features.1986.energy <- mean(X.features.1986$energy)
  features.1985.energy <- mean(X.features.1985$energy)
  features.1984.energy <- mean(X.features.1984$energy)
  features.1983.energy <- mean(X.features.1983$energy)
  features.1982.energy <- mean(X.features.1982$energy)
  features.1981.energy <- mean(X.features.1981$energy)
  features.1980.energy <- mean(X.features.1980$energy)
  
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
  features.2007.tempo <- mean(X.features.2007$tempo)
  features.2006.tempo <- mean(X.features.2006$tempo)
  features.2005.tempo <- mean(X.features.2005$tempo)
  features.2004.tempo <- mean(X.features.2004$tempo)
  features.2003.tempo <- mean(X.features.2003$tempo)
  features.2002.tempo <- mean(X.features.2002$tempo)
  features.2001.tempo <- mean(X.features.2001$tempo)
  features.2000.tempo <- mean(X.features.2000$tempo)
  features.1999.tempo <- mean(X.features.1999$tempo)
  features.1998.tempo <- mean(X.features.1998$tempo)
  features.1997.tempo <- mean(X.features.1997$tempo)
  features.1996.tempo <- mean(X.features.1996$tempo)
  features.1995.tempo <- mean(X.features.1995$tempo)
  features.1994.tempo <- mean(X.features.1994$tempo)
  features.1993.tempo <- mean(X.features.1993$tempo)
  features.1992.tempo <- mean(X.features.1992$tempo)
  features.1991.tempo <- mean(X.features.1991$tempo)
  features.1990.tempo <- mean(X.features.1990$tempo)
  features.1989.tempo <- mean(X.features.1989$tempo)
  features.1988.tempo <- mean(X.features.1988$tempo)
  features.1987.tempo <- mean(X.features.1987$tempo)
  features.1986.tempo <- mean(X.features.1986$tempo)
  features.1985.tempo <- mean(X.features.1985$tempo)
  features.1984.tempo <- mean(X.features.1984$tempo)
  features.1983.tempo <- mean(X.features.1983$tempo)
  features.1982.tempo <- mean(X.features.1982$tempo)
  features.1981.tempo <- mean(X.features.1981$tempo)
  features.1980.tempo <- mean(X.features.1980$tempo)
  
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
  features.2007.loudness <- mean(X.features.2007$loudness)
  features.2006.loudness <- mean(X.features.2006$loudness)
  features.2005.loudness <- mean(X.features.2005$loudness)
  features.2004.loudness <- mean(X.features.2004$loudness)
  features.2003.loudness <- mean(X.features.2003$loudness)
  features.2002.loudness <- mean(X.features.2002$loudness)
  features.2001.loudness <- mean(X.features.2001$loudness)
  features.2000.loudness <- mean(X.features.2000$loudness)
  features.1999.loudness <- mean(X.features.1999$loudness)
  features.1998.loudness <- mean(X.features.1998$loudness)
  features.1997.loudness <- mean(X.features.1997$loudness)
  features.1996.loudness <- mean(X.features.1996$loudness)
  features.1995.loudness <- mean(X.features.1995$loudness)
  features.1994.loudness <- mean(X.features.1994$loudness)
  features.1993.loudness <- mean(X.features.1993$loudness)
  features.1992.loudness <- mean(X.features.1992$loudness)
  features.1991.loudness <- mean(X.features.1991$loudness)
  features.1990.loudness <- mean(X.features.1990$loudness)
  features.1989.loudness <- mean(X.features.1989$loudness)
  features.1988.loudness <- mean(X.features.1988$loudness)
  features.1987.loudness <- mean(X.features.1987$loudness)
  features.1986.loudness <- mean(X.features.1986$loudness)
  features.1985.loudness <- mean(X.features.1985$loudness)
  features.1984.loudness <- mean(X.features.1984$loudness)
  features.1983.loudness <- mean(X.features.1983$loudness)
  features.1982.loudness <- mean(X.features.1982$loudness)
  features.1981.loudness <- mean(X.features.1981$loudness)
  features.1980.loudness <- mean(X.features.1980$loudness)
  
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
  features.2007.speechiness <- mean(X.features.2007$speechiness)
  features.2006.speechiness <- mean(X.features.2006$speechiness)
  features.2005.speechiness <- mean(X.features.2005$speechiness)
  features.2004.speechiness <- mean(X.features.2004$speechiness)
  features.2003.speechiness <- mean(X.features.2003$speechiness)
  features.2002.speechiness <- mean(X.features.2002$speechiness)
  features.2001.speechiness <- mean(X.features.2001$speechiness)
  features.2000.speechiness <- mean(X.features.2000$speechiness)
  features.1999.speechiness <- mean(X.features.1999$speechiness)
  features.1998.speechiness <- mean(X.features.1998$speechiness)
  features.1997.speechiness <- mean(X.features.1997$speechiness)
  features.1996.speechiness <- mean(X.features.1996$speechiness)
  features.1995.speechiness <- mean(X.features.1995$speechiness)
  features.1994.speechiness <- mean(X.features.1994$speechiness)
  features.1993.speechiness <- mean(X.features.1993$speechiness)
  features.1992.speechiness <- mean(X.features.1992$speechiness)
  features.1991.speechiness <- mean(X.features.1991$speechiness)
  features.1990.speechiness <- mean(X.features.1990$speechiness)
  features.1989.speechiness <- mean(X.features.1989$speechiness)
  features.1988.speechiness <- mean(X.features.1988$speechiness)
  features.1987.speechiness <- mean(X.features.1987$speechiness)
  features.1986.speechiness <- mean(X.features.1986$speechiness)
  features.1985.speechiness <- mean(X.features.1985$speechiness)
  features.1984.speechiness <- mean(X.features.1984$speechiness)
  features.1983.speechiness <- mean(X.features.1983$speechiness)
  features.1982.speechiness <- mean(X.features.1982$speechiness)
  features.1981.speechiness <- mean(X.features.1981$speechiness)
  features.1980.speechiness <- mean(X.features.1980$speechiness)
  
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
  features.2007.acousticness <- mean(X.features.2007$acousticness)
  features.2006.acousticness <- mean(X.features.2006$acousticness)
  features.2005.acousticness <- mean(X.features.2005$acousticness)
  features.2004.acousticness <- mean(X.features.2004$acousticness)
  features.2003.acousticness <- mean(X.features.2003$acousticness)
  features.2002.acousticness <- mean(X.features.2002$acousticness)
  features.2001.acousticness <- mean(X.features.2001$acousticness)
  features.2000.acousticness <- mean(X.features.2000$acousticness)
  features.1999.acousticness <- mean(X.features.1999$acousticness)
  features.1998.acousticness <- mean(X.features.1998$acousticness)
  features.1997.acousticness <- mean(X.features.1997$acousticness)
  features.1996.acousticness <- mean(X.features.1996$acousticness)
  features.1995.acousticness <- mean(X.features.1995$acousticness)
  features.1994.acousticness <- mean(X.features.1994$acousticness)
  features.1993.acousticness <- mean(X.features.1993$acousticness)
  features.1992.acousticness <- mean(X.features.1992$acousticness)
  features.1991.acousticness <- mean(X.features.1991$acousticness)
  features.1990.acousticness <- mean(X.features.1990$acousticness)
  features.1989.acousticness <- mean(X.features.1989$acousticness)
  features.1988.acousticness <- mean(X.features.1988$acousticness)
  features.1987.acousticness <- mean(X.features.1987$acousticness)
  features.1986.acousticness <- mean(X.features.1986$acousticness)
  features.1985.acousticness <- mean(X.features.1985$acousticness)
  features.1984.acousticness <- mean(X.features.1984$acousticness)
  features.1983.acousticness <- mean(X.features.1983$acousticness)
  features.1982.acousticness <- mean(X.features.1982$acousticness)
  features.1981.acousticness <- mean(X.features.1981$acousticness)
  features.1980.acousticness <- mean(X.features.1980$acousticness)
  
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
  features.2007.liveness <- mean(X.features.2007$liveness)
  features.2006.liveness <- mean(X.features.2006$liveness)
  features.2005.liveness <- mean(X.features.2005$liveness)
  features.2004.liveness <- mean(X.features.2004$liveness)
  features.2003.liveness <- mean(X.features.2003$liveness)
  features.2002.liveness <- mean(X.features.2002$liveness)
  features.2001.liveness <- mean(X.features.2001$liveness)
  features.2000.liveness <- mean(X.features.2000$liveness)
  features.1999.liveness <- mean(X.features.1999$liveness)
  features.1998.liveness <- mean(X.features.1998$liveness)
  features.1997.liveness <- mean(X.features.1997$liveness)
  features.1996.liveness <- mean(X.features.1996$liveness)
  features.1995.liveness <- mean(X.features.1995$liveness)
  features.1994.liveness <- mean(X.features.1994$liveness)
  features.1993.liveness <- mean(X.features.1993$liveness)
  features.1992.liveness <- mean(X.features.1992$liveness)
  features.1991.liveness <- mean(X.features.1991$liveness)
  features.1990.liveness <- mean(X.features.1990$liveness)
  features.1989.liveness <- mean(X.features.1989$liveness)
  features.1988.liveness <- mean(X.features.1988$liveness)
  features.1987.liveness <- mean(X.features.1987$liveness)
  features.1986.liveness <- mean(X.features.1986$liveness)
  features.1985.liveness <- mean(X.features.1985$liveness)
  features.1984.liveness <- mean(X.features.1984$liveness)
  features.1983.liveness <- mean(X.features.1983$liveness)
  features.1982.liveness <- mean(X.features.1982$liveness)
  features.1981.liveness <- mean(X.features.1981$liveness)
  features.1980.liveness <- mean(X.features.1980$liveness)
  
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
  features.2007.instrumentalness <- mean(X.features.2007$instrumentalness)
  features.2006.instrumentalness <- mean(X.features.2006$instrumentalness)
  features.2005.instrumentalness <- mean(X.features.2005$instrumentalness)
  features.2004.instrumentalness <- mean(X.features.2004$instrumentalness)
  features.2003.instrumentalness <- mean(X.features.2003$instrumentalness)
  features.2002.instrumentalness <- mean(X.features.2002$instrumentalness)
  features.2001.instrumentalness <- mean(X.features.2001$instrumentalness)
  features.2000.instrumentalness <- mean(X.features.2000$instrumentalness)
  features.1999.instrumentalness <- mean(X.features.1999$instrumentalness)
  features.1998.instrumentalness <- mean(X.features.1998$instrumentalness)
  features.1997.instrumentalness <- mean(X.features.1997$instrumentalness)
  features.1996.instrumentalness <- mean(X.features.1996$instrumentalness)
  features.1995.instrumentalness <- mean(X.features.1995$instrumentalness)
  features.1994.instrumentalness <- mean(X.features.1994$instrumentalness)
  features.1993.instrumentalness <- mean(X.features.1993$instrumentalness)
  features.1992.instrumentalness <- mean(X.features.1992$instrumentalness)
  features.1991.instrumentalness <- mean(X.features.1991$instrumentalness)
  features.1990.instrumentalness <- mean(X.features.1990$instrumentalness)
  features.1989.instrumentalness <- mean(X.features.1989$instrumentalness)
  features.1988.instrumentalness <- mean(X.features.1988$instrumentalness)
  features.1987.instrumentalness <- mean(X.features.1987$instrumentalness)
  features.1986.instrumentalness <- mean(X.features.1986$instrumentalness)
  features.1985.instrumentalness <- mean(X.features.1985$instrumentalness)
  features.1984.instrumentalness <- mean(X.features.1984$instrumentalness)
  features.1983.instrumentalness <- mean(X.features.1983$instrumentalness)
  features.1982.instrumentalness <- mean(X.features.1982$instrumentalness)
  features.1981.instrumentalness <- mean(X.features.1981$instrumentalness)
  features.1980.instrumentalness <- mean(X.features.1980$instrumentalness)
  
  ## Calculate Song Length averages
  features.2016.duration_ms <- mean(X.features.2016$duration_ms)
  features.2015.duration_ms <- mean(X.features.2015$duration_ms)
  features.2014.duration_ms <- mean(X.features.2014$duration_ms)
  features.2013.duration_ms <- mean(X.features.2013$duration_ms)
  features.2012.duration_ms <- mean(X.features.2012$duration_ms)
  features.2011.duration_ms <- mean(X.features.2011$duration_ms)
  features.2010.duration_ms <- mean(X.features.2010$duration_ms)
  features.2009.duration_ms <- mean(X.features.2009$duration_ms)
  features.2008.duration_ms <- mean(X.features.2008$duration_ms)
  features.2007.duration_ms <- mean(X.features.2007$duration_ms)
  features.2006.duration_ms <- mean(X.features.2006$duration_ms)
  features.2005.duration_ms <- mean(X.features.2005$duration_ms)
  features.2004.duration_ms <- mean(X.features.2004$duration_ms)
  features.2003.duration_ms <- mean(X.features.2003$duration_ms)
  features.2002.duration_ms <- mean(X.features.2002$duration_ms)
  features.2001.duration_ms <- mean(X.features.2001$duration_ms)
  features.2000.duration_ms <- mean(X.features.2000$duration_ms)
  features.1999.duration_ms <- mean(X.features.1999$duration_ms)
  features.1998.duration_ms <- mean(X.features.1998$duration_ms)
  features.1997.duration_ms <- mean(X.features.1997$duration_ms)
  features.1996.duration_ms <- mean(X.features.1996$duration_ms)
  features.1995.duration_ms <- mean(X.features.1995$duration_ms)
  features.1994.duration_ms <- mean(X.features.1994$duration_ms)
  features.1993.duration_ms <- mean(X.features.1993$duration_ms)
  features.1992.duration_ms <- mean(X.features.1992$duration_ms)
  features.1991.duration_ms <- mean(X.features.1991$duration_ms)
  features.1990.duration_ms <- mean(X.features.1990$duration_ms)
  features.1989.duration_ms <- mean(X.features.1989$duration_ms)
  features.1988.duration_ms <- mean(X.features.1988$duration_ms)
  features.1987.duration_ms <- mean(X.features.1987$duration_ms)
  features.1986.duration_ms <- mean(X.features.1986$duration_ms)
  features.1985.duration_ms <- mean(X.features.1985$duration_ms)
  features.1984.duration_ms <- mean(X.features.1984$duration_ms)
  features.1983.duration_ms <- mean(X.features.1983$duration_ms)
  features.1982.duration_ms <- mean(X.features.1982$duration_ms)
  features.1981.duration_ms <- mean(X.features.1981$duration_ms)
  features.1980.duration_ms <- mean(X.features.1980$duration_ms)

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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.1980.energy,
                         features.1981.energy,
                         features.1982.energy,
                         features.1983.energy,
                         features.1984.energy,
                         features.1985.energy,
                         features.1986.energy,
                         features.1987.energy,
                         features.1988.energy,
                         features.1989.energy,
                         features.1990.energy,
                         features.1991.energy,
                         features.1992.energy,
                         features.1993.energy,
                         features.1994.energy,
                         features.1995.energy,
                         features.1996.energy,
                         features.1997.energy,
                         features.1998.energy,
                         features.1999.energy,
                         features.2000.energy,
                         features.2001.energy,
                         features.2002.energy,
                         features.2003.energy,
                         features.2004.energy,
                         features.2005.energy,
                         features.2006.energy,
                         features.2007.energy,
                         features.2008.energy,
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
          year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                        levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.1980.tempo,
                         features.1981.tempo,
                         features.1982.tempo,
                         features.1983.tempo,
                         features.1984.tempo,
                         features.1985.tempo,
                         features.1986.tempo,
                         features.1987.tempo,
                         features.1988.tempo,
                         features.1989.tempo,
                         features.1990.tempo,
                         features.1991.tempo,
                         features.1992.tempo,
                         features.1993.tempo,
                         features.1994.tempo,
                         features.1995.tempo,
                         features.1996.tempo,
                         features.1997.tempo,
                         features.1998.tempo,
                         features.1999.tempo,
                         features.2000.tempo,
                         features.2001.tempo,
                         features.2002.tempo,
                         features.2003.tempo,
                         features.2004.tempo,
                         features.2005.tempo,
                         features.2006.tempo,
                         features.2007.tempo,
                         features.2008.tempo,
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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c( features.1980.loudness,
                          features.1981.loudness,
                          features.1982.loudness,
                          features.1983.loudness,
                          features.1984.loudness,
                          features.1985.loudness,
                          features.1986.loudness,
                          features.1987.loudness,
                          features.1988.loudness,
                          features.1989.loudness,
                          features.1990.loudness,
                          features.1991.loudness,
                          features.1992.loudness,
                          features.1993.loudness,
                          features.1994.loudness,
                          features.1995.loudness,
                          features.1996.loudness,
                          features.1997.loudness,
                          features.1998.loudness,
                          features.1999.loudness,
                          features.2000.loudness,
                          features.2001.loudness,
                          features.2002.loudness,
                          features.2003.loudness,
                          features.2004.loudness,
                          features.2005.loudness,
                          features.2006.loudness,
                          features.2007.loudness,
                          features.2008.loudness,
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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c(features.1980.speechiness,
                         features.1981.speechiness,
                         features.1982.speechiness,
                         features.1983.speechiness,
                         features.1984.speechiness,
                         features.1985.speechiness,
                         features.1986.speechiness,
                         features.1987.speechiness,
                         features.1988.speechiness,
                         features.1989.speechiness,
                         features.1990.speechiness,
                         features.1991.speechiness,
                         features.1992.speechiness,
                         features.1993.speechiness,
                         features.1994.speechiness,
                         features.1995.speechiness,
                         features.1996.speechiness,
                         features.1997.speechiness,
                         features.1998.speechiness,
                         features.1999.speechiness,
                         features.2000.speechiness,
                         features.2001.speechiness,
                         features.2002.speechiness,
                         features.2003.speechiness,
                         features.2004.speechiness,
                         features.2005.speechiness,
                         features.2006.speechiness,
                         features.2007.speechiness,
                         features.2008.speechiness,
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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),
        stat_average = c( features.1980.acousticness,
                          features.1981.acousticness,
                          features.1982.acousticness,
                          features.1983.acousticness,
                          features.1984.acousticness,
                          features.1985.acousticness,
                          features.1986.acousticness,
                          features.1987.acousticness,
                          features.1988.acousticness,
                          features.1989.acousticness,
                          features.1990.acousticness,
                          features.1991.acousticness,
                          features.1992.acousticness,
                          features.1993.acousticness,
                          features.1994.acousticness,
                          features.1995.acousticness,
                          features.1996.acousticness,
                          features.1997.acousticness,
                          features.1998.acousticness,
                          features.1999.acousticness,
                          features.2000.acousticness,
                          features.2001.acousticness,
                          features.2002.acousticness,
                          features.2003.acousticness,
                          features.2004.acousticness,
                          features.2005.acousticness,
                          features.2006.acousticness,
                          features.2007.acousticness,
                          features.2008.acousticness,
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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),        
        stat_average = c(features.1980.liveness,
                         features.1981.liveness,
                         features.1982.liveness,
                         features.1983.liveness,
                         features.1984.liveness,
                         features.1985.liveness,
                         features.1986.liveness,
                         features.1987.liveness,
                         features.1988.liveness,
                         features.1989.liveness,
                         features.1990.liveness,
                         features.1991.liveness,
                         features.1992.liveness,
                         features.1993.liveness,
                         features.1994.liveness,
                         features.1995.liveness,
                         features.1996.liveness,
                         features.1997.liveness,
                         features.1998.liveness,
                         features.1999.liveness,
                         features.2000.liveness,
                         features.2001.liveness,
                         features.2002.liveness,
                         features.2003.liveness,
                         features.2004.liveness,
                         features.2005.liveness,
                         features.2006.liveness,
                         features.2007.liveness,
                         features.2008.liveness,
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
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),        
        stat_average = c(features.1980.instrumentalness,
                         features.1981.instrumentalness,
                         features.1982.instrumentalness,
                         features.1983.instrumentalness,
                         features.1984.instrumentalness,
                         features.1985.instrumentalness,
                         features.1986.instrumentalness,
                         features.1987.instrumentalness,
                         features.1988.instrumentalness,
                         features.1989.instrumentalness,
                         features.1990.instrumentalness,
                         features.1991.instrumentalness,
                         features.1992.instrumentalness,
                         features.1993.instrumentalness,
                         features.1994.instrumentalness,
                         features.1995.instrumentalness,
                         features.1996.instrumentalness,
                         features.1997.instrumentalness,
                         features.1998.instrumentalness,
                         features.1999.instrumentalness,
                         features.2000.instrumentalness,
                         features.2001.instrumentalness,
                         features.2002.instrumentalness,
                         features.2003.instrumentalness,
                         features.2004.instrumentalness,
                         features.2005.instrumentalness,
                         features.2006.instrumentalness,
                         features.2007.instrumentalness,
                         features.2008.instrumentalness,
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
    } else if(input$features == "Song Length"){
      dat <- data.frame(
        year = factor(c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016), 
                      levels=c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)),        
        stat_average = c(features.1980.duration_ms,
                         features.1981.duration_ms,
                         features.1982.duration_ms,
                         features.1983.duration_ms,
                         features.1984.duration_ms,
                         features.1985.duration_ms,
                         features.1986.duration_ms,
                         features.1987.duration_ms,
                         features.1988.duration_ms,
                         features.1989.duration_ms,
                         features.1990.duration_ms,
                         features.1991.duration_ms,
                         features.1992.duration_ms,
                         features.1993.duration_ms,
                         features.1994.duration_ms,
                         features.1995.duration_ms,
                         features.1996.duration_ms,
                         features.1997.duration_ms,
                         features.1998.duration_ms,
                         features.1999.duration_ms,
                         features.2000.duration_ms,
                         features.2001.duration_ms,
                         features.2002.duration_ms,
                         features.2003.duration_ms,
                         features.2004.duration_ms,
                         features.2005.duration_ms,
                         features.2006.duration_ms,
                         features.2007.duration_ms,
                         features.2008.duration_ms,
                         features.2009.duration_ms,
                         features.2010.duration_ms,
                         features.2011.duration_ms,
                         features.2012.duration_ms,
                         features.2013.duration_ms,
                         features.2014.duration_ms,
                         features.2015.duration_ms,
                         features.2016.duration_ms))
      all.years.feature <-Reduce(function(...) merge(..., by='X', all=T), lapply(names(all.features), Merge.feature.year, 'duration_ms'))
      feature.years <- features.all.songs%>%select(feature = duration_ms, Year)
  
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
    year.recommendations <- GetRecommendedYears(track.id)
    output$table <- renderDataTable({
      datatable(year.recommendations, options = list(dom = 't'))
    })
    output$tablep <- renderDataTable({
      datatable(recommendations, options = list(dom = 't'))
    })
  })
})

