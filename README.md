Bios 611 Project1
=================
IMDB MOVIE GENRE-GROSS ANALYSIS
-------------------------------

Proposal
--------

Introduction
------------
 Watching a movie is one of the favorite hobbies these days.
As there has been growing interest in film industy, it is interesting to see which genre of movie makes large profits. 
In other words, if you were a film maker, what kind of movie do you have to make?


This project will include descriptive statistics about the relationship between genres and gross. For this visualization, I plan to make it in an interactive form by using Plotly package.


The project will also include modeling to predict the possibility for a movie to make large profits on the basis of its genres.
To be specific, I will randomly pick three genres for a movie and predict whether its profit is in the top 25%.
I do not know about predictive modeling techniques yet. I will apply techniques presented in the class such as bayesian models, tree based regression. 

Dataset
--------
 The dataset I will use is publicly available on Kaggle. The address is "https://www.kaggle.com/pysaphal/imdb-20002019-movie-data-set-over-3000?select=df_movie_ratings.csv".
The dataset is scraped from IMDB and contains the information about movies released in the cinema between 2000 and 2019.
The columns of the data are movie title, gross, imdb user's rating, genres, release year, and so on.


 Each movie in the data normally belongs to one-to-three genres among total 21 genres. For example, the genres of Gladiator are action, adventure, and drama.
Movies will be grouped into the two groups by total gross, one is the top 25% grossing group and the other is the lower 75% grossing group.
The added 'result' column in the wrangled dataset shows which group a movie belongs to. If a movie is in the top 25%, the movie will be considered as success in the result column, otherwise as failure.

Preliminary Figures
-------------------

![](assets/freq_genre_by_result.png)

 The two histograms show that there is a difference of the distribution of the genres over gross. 

![](assets/genre_comp_table_by_result.png)
 The difference looks clearer in this figure. Some genres, such as fantasy, animation, and family, is in the list of top 10 genres in the success group.
However, they are below the 10th place in the failure group. 


Usage
------------------

 You will need Docker. You need to be able to run docker as your user.

    docker build . -t project1_env
    docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=9779 -t project1_env

Makefile
--------

 To build the above preliminary figures relating to the distribution of genre over gross,\
enter the below command in Bash or Rstudio.

	make figures/freq_genre_by_result.png
	make figures/genre_comp_table_by_result.png


