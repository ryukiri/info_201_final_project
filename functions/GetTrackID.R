library(httr)
library(jsonlite)

#Get Spotify track ID from user's song
GetTrackID <- function(my.song) {
  keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")
  
  track.params <- list(q = my.song, type = "track", limit = 1)
  track.response <- httr::GET("https://api.spotify.com/v1/search", query = track.params, httr::config(token = keys))
  track.body <- content(track.response, "text")
  track.data <- fromJSON(track.body)
  track.df <- as.data.frame(track.data$tracks[2])
  track.id <- track.df$items.id
  return(track.id)
}

