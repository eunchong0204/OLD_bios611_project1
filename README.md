Bios 611 Project1
=================
Breast Cancer Proteome Analysis
-------------------------------


This repo will eventually contain an analysis of Breast Cancer Proteomes

Using This Project
------------------

You will need Docker. You need to be able to run docker as your user.

    docker build . -t project1_env
    docker run -v `pwd`:/home/rstudio -p 8787:8787 -e PASSWORD=9779 -t project1_env

