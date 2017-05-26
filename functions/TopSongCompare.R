# Take the average data from the top X songs of two years
# and compare stats
#library(dplyr)

# Returns a dataframe with the averages for each category in both years

TopSongCompare <- function(year_one, year_two, song_count){
  year_one <- year_one %>%
              filter(X1 <= song_count) %>%
              select(danceability, energy, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms)
  year_two <- year_two %>%
              filter(X1 <= song_count) %>%
              select(danceability, energy, speechiness, acousticness, instrumentalness, liveness, valence, tempo, duration_ms)
  
  year_one_average <- year_one %>%
                      colMeans() %>% 
                      round(digits = 5)
  year_two_average <- year_two %>%
                      colMeans() %>% 
                      round(digits = 5)
  do.call(rbind, Map(data.frame, Year_One=year_one_average, Year_Two=year_two_average))
}
