## Collect the data of one feature in each year

Merge.feature.year <- function(the.features, feature){
  the.year<- as.numeric(gsub("[^0-9]", "", the.features))
  the <- get(paste0('features.', the.year))
  name <- toString(the.year)
  the.x = get(the.features)$X
  year = data.frame(get(the.features)[[feature]], X = the.x)
  colnames(year)[1] <- toString(the.year)
  return(year)
}
