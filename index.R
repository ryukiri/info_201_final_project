install.packages("devtools")
install_github("tiagomendesdantas/Rspotify")
library(devtools)
library(Rspotify)
library(dplyr)

## Set Working Directory
# setwd("~/Documents/Info 201/info_201_final_project")
setwd("C:/Users/Austin Quach/Google Drive/College/Sophomore/Info 201/Homework/info_201_final_project")

songs.2016 <- read.csv("Songs/Songs - 2016.csv")
songs.2015 <- read.csv("Songs/Songs - 2015.csv")
songs.2014 <- read.csv("Songs/Songs - 2014.csv")
songs.2013 <- read.csv("Songs/Songs - 2013.csv")
songs.2012 <- read.csv("Songs/Songs - 2012.csv")
songs.2011 <- read.csv("Songs/Songs - 2011.csv")
songs.2010 <- read.csv("Songs/Songs - 2010.csv")
songs.2009 <- read.csv("Songs/Songs - 2009.csv")
songs.2008 <- read.csv("Songs/Songs - 2008.csv")
keys <- spotifyOAuth("Info 201","ae706b417cc645f78c559186204dadd4","5f5769652ae24ceca43e05074b8b84eb")

source("functions/GetSongData.R")

## Merging audio features and songs together
merge.2016 <- features.2016 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2016, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2015 <- features.2015 %>% 
  mutate(Spotify.ID= id) %>% 
  left_join(songs.2015, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2014 <- features.2014 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2014, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2013 <- features.2013 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2013, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2012 <- features.2012 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2012, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2011 <- features.2011 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2011, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2010 <- features.2010 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2010, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2009 <- features.2009 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2009, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2008 <- features.2008 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2008, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

write.csv(merge.2016, file="songsMerged/songs.merged.2016.csv")
write.csv(merge.2015, file="songsMerged/songs.merged.2015.csv")
write.csv(merge.2014, file="songsMerged/songs.merged.2014.csv")
write.csv(merge.2013, file="songsMerged/songs.merged.2013.csv")
write.csv(merge.2012, file="songsMerged/songs.merged.2012.csv")
write.csv(merge.2011, file="songsMerged/songs.merged.2011.csv")
write.csv(merge.2010, file="songsMerged/songs.merged.2010.csv")
write.csv(merge.2009, file="songsMerged/songs.merged.2009.csv")
write.csv(merge.2008, file="songsMerged/songs.merged.2008.csv")

## Everything merged together
merged.all.features <- rbind(merge.2016, merge.2015, merge.2014, merge.2013, merge.2012, merge.2011, merge.2010, merge.2009, merge.2008)
write.csv(merged.all.features, file = "songsMerged/songs.merged.all.csv")

## Grabbing audio features
features.2016 <- as.data.frame(do.call(rbind, lapply(songs.2016$Spotify.ID, getAudioFeatures) ))
features.2015 <- as.data.frame(do.call(rbind, lapply(songs.2015$Spotify.ID, getAudioFeatures) ))
features.2014 <- as.data.frame(do.call(rbind, lapply(songs.2014$Spotify.ID, getAudioFeatures) ))
features.2013 <- as.data.frame(do.call(rbind, lapply(songs.2013$Spotify.ID, getAudioFeatures) ))
features.2012 <- as.data.frame(do.call(rbind, lapply(songs.2012$Spotify.ID, getAudioFeatures) ))
features.2011 <- as.data.frame(do.call(rbind, lapply(songs.2011$Spotify.ID, getAudioFeatures) ))
features.2010 <- as.data.frame(do.call(rbind, lapply(songs.2010$Spotify.ID, getAudioFeatures) ))
features.2009 <- as.data.frame(do.call(rbind, lapply(songs.2009$Spotify.ID, getAudioFeatures) ))
features.2008 <- as.data.frame(do.call(rbind, lapply(songs.2008$Spotify.ID, getAudioFeatures) ))

## Writing audio features to a file
write.csv(as.data.frame(do.call(rbind, lapply(songs.2016[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2016.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2015[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2015.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2014[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2014.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2013[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2013.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2012[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2012.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2011[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2011.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2010[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2010.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2009[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2009.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2008[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2008.csv")