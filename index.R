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

merge.2007 <- features.2007 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2007, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2006 <- features.2006 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2006, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2005 <- features.2005 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2005, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2004 <- features.2004 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2004, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2003 <- features.2003 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2003, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2002 <- features.2002 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2002, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2001 <- features.2001 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2001, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.2000 <- features.2000 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2000, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1999 <- features.1999 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1999, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1998 <- features.1998 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1998, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1997 <- features.1997 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1997, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1996 <- features.1996 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1996, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1995 <- features.1995 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1995, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1994 <- features.1994 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1994, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1993 <- features.1993 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1993, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1992 <- features.1992 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1992, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1991 <- features.1991 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1991, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1990 <- features.1990 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.2000, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1989 <- features.1989 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1989, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1988 <- features.1988 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1988, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1987 <- features.1987 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1987, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1986 <- features.1986 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1986, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1985 <- features.1985 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1985, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1984 <- features.1984 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1984, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1983 <- features.1983 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1983, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1982 <- features.1982 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1982, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1981 <- features.1981 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1981, by = 'Spotify.ID') %>%
  select(Song, Artist, Year, Spotify.ID, danceability, energy, tempo, loudness, speechiness, acousticness, instrumentalness, liveness)

merge.1980 <- features.1980 %>% 
  mutate(Spotify.ID = id) %>% 
  left_join(songs.1980, by = 'Spotify.ID') %>%
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
write.csv(merge.2007, file="songsMerged/songs.merged.2007.csv")
write.csv(merge.2006, file="songsMerged/songs.merged.2006.csv")
write.csv(merge.2005, file="songsMerged/songs.merged.2005.csv")
write.csv(merge.2004, file="songsMerged/songs.merged.2004.csv")
write.csv(merge.2003, file="songsMerged/songs.merged.2003.csv")
write.csv(merge.2002, file="songsMerged/songs.merged.2002.csv")
write.csv(merge.2001, file="songsMerged/songs.merged.2001.csv")
write.csv(merge.2000, file="songsMerged/songs.merged.2000.csv")
write.csv(merge.1999, file="songsMerged/songs.merged.1999.csv")
write.csv(merge.1998, file="songsMerged/songs.merged.1998.csv")
write.csv(merge.1997, file="songsMerged/songs.merged.1997.csv")
write.csv(merge.1996, file="songsMerged/songs.merged.1996.csv")
write.csv(merge.1995, file="songsMerged/songs.merged.1995.csv")
write.csv(merge.1994, file="songsMerged/songs.merged.1994.csv")
write.csv(merge.1993, file="songsMerged/songs.merged.1993.csv")
write.csv(merge.1992, file="songsMerged/songs.merged.1992.csv")
write.csv(merge.1991, file="songsMerged/songs.merged.1991.csv")
write.csv(merge.1990, file="songsMerged/songs.merged.1990.csv")
write.csv(merge.1989, file="songsMerged/songs.merged.1989.csv")
write.csv(merge.1988, file="songsMerged/songs.merged.1988.csv")
write.csv(merge.1987, file="songsMerged/songs.merged.1987.csv")
write.csv(merge.1986, file="songsMerged/songs.merged.1986.csv")
write.csv(merge.1985, file="songsMerged/songs.merged.1985.csv")
write.csv(merge.1984, file="songsMerged/songs.merged.1984.csv")
write.csv(merge.1983, file="songsMerged/songs.merged.1983.csv")
write.csv(merge.1982, file="songsMerged/songs.merged.1982.csv")
write.csv(merge.1981, file="songsMerged/songs.merged.1981.csv")
write.csv(merge.1980, file="songsMerged/songs.merged.1980.csv")

## Everything merged together
merged.all.features <- rbind(merge.2016, merge.2015, merge.2014, merge.2013, merge.2012, merge.2011, merge.2010, merge.2009, merge.2008, merge.2007, merge.2006, merge.2005, merge.2004, merge.2003, merge.2002, merge.2001, merge.2000, 
                             merge.1999, merge.1998, merge.1997, merge.1996, merge.1995, merge.1994, merge.1993, merge.1992, merge.1991, merge.1990, 
                             merge.1989, merge.1988, merge.1987, merge.1986, merge.1985, merge.1984, merge.1983, merge.1982, merge.1981, merge.1980)
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
features.2007 <- as.data.frame(do.call(rbind, lapply(songs.2007$Spotify.ID, getAudioFeatures) ))
features.2006 <- as.data.frame(do.call(rbind, lapply(songs.2006$Spotify.ID, getAudioFeatures) ))
features.2005 <- as.data.frame(do.call(rbind, lapply(songs.2005$Spotify.ID, getAudioFeatures) ))
features.2004 <- as.data.frame(do.call(rbind, lapply(songs.2004$Spotify.ID, getAudioFeatures) ))
features.2003 <- as.data.frame(do.call(rbind, lapply(songs.2003$Spotify.ID, getAudioFeatures) ))
features.2002 <- as.data.frame(do.call(rbind, lapply(songs.2002$Spotify.ID, getAudioFeatures) ))
features.2001 <- as.data.frame(do.call(rbind, lapply(songs.2001$Spotify.ID, getAudioFeatures) ))
features.2000 <- as.data.frame(do.call(rbind, lapply(songs.2000$Spotify.ID, getAudioFeatures) ))
features.1999 <- as.data.frame(do.call(rbind, lapply(songs.1999$Spotify.ID, getAudioFeatures) ))
features.1998 <- as.data.frame(do.call(rbind, lapply(songs.1998$Spotify.ID, getAudioFeatures) ))
features.1997 <- as.data.frame(do.call(rbind, lapply(songs.1997$Spotify.ID, getAudioFeatures) ))
features.1996 <- as.data.frame(do.call(rbind, lapply(songs.1996$Spotify.ID, getAudioFeatures) ))
features.1995 <- as.data.frame(do.call(rbind, lapply(songs.1995$Spotify.ID, getAudioFeatures) ))
features.1994 <- as.data.frame(do.call(rbind, lapply(songs.1994$Spotify.ID, getAudioFeatures) ))
features.1993 <- as.data.frame(do.call(rbind, lapply(songs.1993$Spotify.ID, getAudioFeatures) ))
features.1992 <- as.data.frame(do.call(rbind, lapply(songs.1992$Spotify.ID, getAudioFeatures) ))
features.1991 <- as.data.frame(do.call(rbind, lapply(songs.1991$Spotify.ID, getAudioFeatures) ))
features.1990 <- as.data.frame(do.call(rbind, lapply(songs.1990$Spotify.ID, getAudioFeatures) ))
features.1989 <- as.data.frame(do.call(rbind, lapply(songs.1989$Spotify.ID, getAudioFeatures) ))
features.1988 <- as.data.frame(do.call(rbind, lapply(songs.1988$Spotify.ID, getAudioFeatures) ))
features.1987 <- as.data.frame(do.call(rbind, lapply(songs.1987$Spotify.ID, getAudioFeatures) ))
features.1986 <- as.data.frame(do.call(rbind, lapply(songs.1986$Spotify.ID, getAudioFeatures) ))
features.1985 <- as.data.frame(do.call(rbind, lapply(songs.1985$Spotify.ID, getAudioFeatures) ))
features.1984 <- as.data.frame(do.call(rbind, lapply(songs.1984$Spotify.ID, getAudioFeatures) ))
features.1983 <- as.data.frame(do.call(rbind, lapply(songs.1983$Spotify.ID, getAudioFeatures) ))
features.1982 <- as.data.frame(do.call(rbind, lapply(songs.1982$Spotify.ID, getAudioFeatures) ))
features.1981 <- as.data.frame(do.call(rbind, lapply(songs.1981$Spotify.ID, getAudioFeatures) ))
features.1980 <- as.data.frame(do.call(rbind, lapply(songs.1980$Spotify.ID, getAudioFeatures) ))

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
write.csv(as.data.frame(do.call(rbind, lapply(songs.2007[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2007.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2006[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2006.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2005[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2005.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2004[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2004.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2003[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2003.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2002[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2002.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2001[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2001.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.2000[["Spotify.ID"]], getAudioFeatures) )), file="features/features.2000.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1999[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1999.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1998[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1998.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1997[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1997.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1996[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1996.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1995[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1995.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1994[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1994.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1993[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1993.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1992[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1992.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1991[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1991.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1990[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1990.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1989[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1989.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1988[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1988.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1987[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1987.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1986[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1986.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1985[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1985.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1984[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1984.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1983[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1983.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1982[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1982.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1981[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1981.csv")
write.csv(as.data.frame(do.call(rbind, lapply(songs.1980[["Spotify.ID"]], getAudioFeatures) )), file="features/features.1980.csv")



