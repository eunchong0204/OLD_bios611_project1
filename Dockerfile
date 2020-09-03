FROM rocker/verse
MAINTAINER Eunchong Kang <eunchong@email.unc.edu>
RUN R -e "install.packages('xlsx')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('caret')"
RUN R -e "install.packages('gridExtra')"
RUN echo "Hello World"