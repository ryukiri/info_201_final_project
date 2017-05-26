library(Rspotify)

# Takes a list or dataframe of Spotify Song IDs and returns a data frame of the
# Song ID and data about that song (energy, danceability, etc...) which can then be merged
# to existing dataframes if desired
getAudioFeatures <- function(my_song) {
  if (my_song != "Not on Spotify") {
    audio.features <- getFeatures(my_song, token=keys)
    return(audio.features)
  }
}