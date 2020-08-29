library(tidyverse)
library(stringr)

ratings <- read.csv("source_data/imdb_movie_ratings.csv")

## Cleanup, figure making, tidying, filtering

write.csv(ratings, "derived_data/ratings.csv")
