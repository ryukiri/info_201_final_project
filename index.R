install.packages("rPython")
install.packages("rjson")
install.packages("devtools")
library(rjson)
library(jsonlite)
library(rPython)
library(devtools)
library(Rspotify)

## Set Working Directory
setwd("~/Documents/Info 201/info_201_final_project")

songs <- read.csv("songs2.csv")
keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")

song.test <- lapply(songs$Spotify.ID, getAudioFeatures)

getAudioFeatures <- function(my_song) {
  if (my_song != "Not on Spotify") {
    audio.features <- getFeatures(my_song, token=keys)
    return(audio.features)
  }
}

