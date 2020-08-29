library(tidyverse)
#I added stringr to analyze which genre is the favorite of IMDB users later.
#Each movie in the dataset belongs to several genres which are combined as one character.
library(stringr)

ratings <- read.csv("source_data/imdb_movie_ratings.csv")

## Cleanup, figure making, tidying, filtering

#get rid of duplicated observations.
ratings <- ratings[,2:10]
ratings <- unique(ratings)
nrow(ratings)
ratings <- as_tibble(ratings)

write.csv(ratings, "derived_data/ratings.csv")


