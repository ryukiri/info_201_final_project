library(httr)
library(jsonlite)
library(Rspotify)
library(dplyr)

GetRecommendations <- function(track.id) {
  keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")
  
  rec.params <- list(seed_tracks = track.id, limit = 10)
  rec.response <- httr::GET("https://api.spotify.com/v1/recommendations", query = rec.params, httr::config(token = keys))
  rec.body <- content(rec.response, "text")
  rec.data <- fromJSON(rec.body)
  rec.df <- as.data.frame(rec.data) %>% select(tracks.name, tracks.id)
  colnames(rec.df) <- c("Song", "Spotify ID")
  return(rec.df)
}