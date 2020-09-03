library(tidyverse)
library(stringr)
library(dplyr)
library(gridExtra)


tidy_movie_rating <- read.csv("derived_data/tidy_movie_rating.csv")

#preliminary figure 2.

normalized_counts <- tidy_movie_rating %>%
  group_by(genre, result) %>%
  summarize(n=sum(is))

normalized_counts <- normalized_counts %>%
  group_by(result) %>% arrange(desc(n)) %>%
  mutate(rank = row_number()) %>%
  ungroup()

normalized_counts

small_set <- rbind(normalized_counts %>% filter(result=="s") %>% head(15),
                   normalized_counts %>% filter(result=="f") %>% head(15))

result_to_position <- function(g){
  c(s=-2, f=2)[g]
}

result_to_line_position <- function(g){
  c(s=-1, f=1)[g]
}

small_set$x_pos <- result_to_position(small_set$result)
small_set$line_x_pos <- result_to_line_position(small_set$result)


genre_comp_table_by_result <- ggplot(small_set, aes(x_pos,rank)) +
  scale_y_reverse() +
  geom_tile(width=2.25, height=0.8, aes(fill=genre)) +
  geom_text(aes(label=genre)) +
  theme(legend.position = "bottom") +
  geom_line(aes(x=line_x_pos, color=genre)) +
  scale_x_continuous("Result", c()) +
  geom_text(data=tibble(x=c(-2,2), y=c(17, 17), label=c("Success", "Failure")),
            aes(x=x, y=y, label=label))
ggsave("figures/genre_comp_table_by_result.png", plot=genre_comp_table_by_result)
