.PHONY: clean

clean:
	rm -f derived_data/*.csv
	rm -f figures/*.png
	rm -f Rplots.pdf

derived_data/tidy_movie_rating.csv:\
 source_data/imdb_movie_ratings.csv\
 tidy_source_data.R
	Rscript tidy_source_data.R

figures/freq_genre_by_result.png:\
 derived_data/tidy_movie_rating.csv\
 preliminary_figures1.R
	Rscript preliminary_figures1.R

figures/genre_comp_table_by_result.png:\
 derived_data/tidy_movie_rating.csv\
 preliminary_figures2.R
	Rscript preliminary_figures2.R

assets/freq_genre_by_result.png:\
 figures/freq_genre_by_result.png
	cp figures/freq_genre_by_result.png assets/freq_genre_by_result.png

assets/genre_comp_table_by_result.png:\
 figures/genre_comp_table_by_result.png
	cp figures/genre_comp_table_by_result.png assets/genre_comp_table_by_result.png