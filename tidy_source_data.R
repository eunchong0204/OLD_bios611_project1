library(tidyverse)
library(stringr)
library(dplyr)

#deleting duplications.
data <- read.csv("source_data/imdb_movie_ratings.csv")
newdata <- data[,2:10]
newdata <- unique(newdata)


#modifying data structure.
genres <- c("Action", "Adventure", "Animation", "Biography", "Comedy",
            "Crime", "Documentary", "Drama", "Family", "Fantasy",
            "History", "Horror", "Musical", "Music", "Mystery",
            "Romance", "Sci-Fi", "Sport", "Thriller", "War", "Western")

i <- 10
for (x in genres){
  newdata <- cbind(newdata, str_detect(newdata$genre, x))
  names(newdata)[i] <- x
  i <- i + 1
}

names(newdata) <- names(newdata) %>% tolower() %>% 
  str_replace_all(" ", "_") %>%
  str_replace_all("-", "_")

movie_rating <- newdata %>% select(-year, -metascore, -votes, -genre, -runtime, -n_imdb)

movie_rating <-as_tibble(movie_rating)

`%without%` <- function(strs, remove_these){
  strs[!(strs %in% remove_these)]
}


tidy_movie_rating <- pivot_longer(movie_rating, names(movie_rating) %without% c("movie", "imdb", "gross"),
                                  names_to="genre", values_to="is")

genre_count <- tidy_movie_rating %>% group_by(genre) %>%
  summarize(count=sum(is)) %>%
  arrange(desc(count))

tidy_movie_rating$genre <- factor(tidy_movie_rating$genre, levels=genre_count$genre)



#dividing success or failure by gross.
tidy_movie_rating <- na.omit(tidy_movie_rating) #deleting rows with NA.

#considering a movie successful if its total gross is in top 25%.
q25 <- quantile(tidy_movie_rating$gross, probs = 0.75)

tidy_movie_rating[tidy_movie_rating$gross >= q25, "result"] = "s"
tidy_movie_rating[tidy_movie_rating$gross < q25, "result"] = "f"

tidy_movie_rating$result <- factor(tidy_movie_rating$result, levels=c("s","f"))


write.csv(tidy_movie_rating, "derived_data/tidy_movie_rating.csv")


