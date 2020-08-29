library(tidyverse)
library(gridExtra)

#Basic figuring
#Is there any association between a rating of imdb users and that of critics?

ratings <- read.csv("derived_data/ratings.csv")
assn_imdb_meta <- ggplot(ratings, aes(imdb, metascore)) + 
  geom_point(color="black", alpha=0.4) +
  xlim(0, 10) +
  ylim(0, 100) +
  labs(title="Movie Ratings from 2000 to present")


#I would like to check if there is variations in rating bewteen years.

recent_ratings <- ratings %>% filter(ratings$year >= 2016 & ratings$year <= 2018) %>%
  select(year, imdb, metascore)

recent_ratings$year <- as.factor(recent_ratings$year)

assn_imdb_meta_byyear <- ggplot(recent_ratings, aes(imdb, metascore)) +
  geom_point(aes(color=year),alpha=0.4) +
  xlim(0, 10) +
  ylim(0, 100) +
  theme(legend.position=c(0,1), legend.justification=c(0,1)) +
  labs(title="Movie Ratings from 2016 to 2018")

association_imdb_meta <- grid.arrange(assn_imdb_meta, assn_imdb_meta_byyear, ncol=2)


ggsave("figures/association_imdb_metascore.png", plot=association_imdb_meta)

