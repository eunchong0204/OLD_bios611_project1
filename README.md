Bios 611 Project1
=================
IMDB MOVIE RATINGS ANALYSIS
-------------------------------
(I changed the data to be analysed from Breast cancer proteomes to IMDB movie ratings data)


![](assets/freq_genre_by_result.png)

![](assets/genre_comp_table_by_result.png)

This repo will eventually contain an analysis of IMDB movie ratings data.

Using This Project
------------------

You will need Docker. You need to be able to run docker as your user.

    docker build . -t project1_env
    docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=9779 -t project1_env


Cleaning data
-------------

The raw data has many duplicate observations.

I eliminated those obaservations and it resulted in 904 unique observations.

Also, I converted the type of data to a tibble.



The First Figure
----------------
I made the figure showing the association between the rating of IMDB users and that of critics.

I think it has a strong association!.
 
