## Collect the data of one feature in each year

Merge.feature.year <- function(the.features, feature){
  the.year<- as.numeric(gsub("[^0-9]", "", the.features))
  #the <- get(paste0('X.features.', the.year))
  name <- toString(the.year)
  the.x = get(the.features)$X
  year = data.frame(get(the.features)[[feature]], X = the.x)
  colnames(year)[1] <- toString(the.year)
  return(year)
}

all.features <- list(
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


