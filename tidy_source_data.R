library(tidyverse)

proteomes <- read.csv("source_data/BC_proteomes_data.csv")
clinical <- read.csv("source_data/BC_clinical_data.csv")
proteins_info <- read.csv("source_data/proteins_information.csv")

## Cleanup, figure making, tidying, filtering

write.csv(proteomes, "derived_data/proteomes.csv")
write.csv(clinical, "derived_data/clinical.csv")
write.csv(proteins_info, "derived_data/proteins_info.csv")
