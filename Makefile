.PHONY: clean

clean:
	rm derived_data/*

derived_data/ratings.csv:\
 source_data/imdb_movie_ratings.csv tidy_source_data.R
	Rscript tidy_source_data.R

figures/association_imdb_metascore.png:\
 derived_data/ratings.csv association_imdb_metascore.R
	Rscript association_imdb_metascore.R