Bios 611 Project1
=================
IMDB MOVIE RATINGS ANALYSIS
-------------------------------

Proposal
--------

Introduction
------------



Dataset
--------



Preliminary Figures
-------------------

![](assets/freq_genre_by_result.png)

The Two histogram show that there is a difference of the distribution of the genres over gross. 

![](assets/genre_comp_table_by_result.png)
The difference looks clearer in this figure. Some genres, such as fantasy, animation, and family, belongs to the list of top 10 in the success group.
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


