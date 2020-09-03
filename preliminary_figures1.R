library(tidyverse)
library(stringr)
library(dplyr)
library(gridExtra)


tidy_movie_rating <- read.csv("derived_data/tidy_movie_rating.csv")


#preliminary figure 1.

plot_count <- function(d, title){
  genre_count <- d %>% group_by(genre) %>%
    summarize(count=sum(is)) %>%
    arrange(desc(count))
  d$genre <- factor(d$genre, levels=genre_count$genre)
  ggplot(d %>% filter(is=="TRUE"), aes(genre)) +
    geom_histogram(stat="count") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    labs(title=title);
}

p_success <- plot_count(tidy_movie_rating %>% filter(result=="s"), title="Top 25% grossing movies")
p_failure <- plot_count(tidy_movie_rating %>% filter(result=="f"), title="Lower 75% grossing movies")

freq_genre_by_result <- grid.arrange(p_success, p_failure, nrow=2)
ggsave("figures/freq_genre_by_result.png", plot=freq_genre_by_result)


