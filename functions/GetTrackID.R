GetTrackID <- function(my.song) {
  track.params <- list(q = my.song, type = "track", limit = 1)
  track.response <- GET("https://api.spotify.com/v1/search", query = track.params)
  track.body <- content(track.response, "text")
  track.data <- fromJSON(track.body)
  track.df <- as.data.frame(track.data$tracks[2])
  track.id <- track.df$items.id
  return(track.id)
}