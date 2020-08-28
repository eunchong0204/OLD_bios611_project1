

derived_data/proteomes.csv derived_data/clinical.csv derived_data/proteins_info.csv:\
 source_data/BC_proteomes_data.csv source_data/BC_clinical_data.csv\
 source_data/proteins_information.csv tidy_source_data.R
	Rscript tidy_source_data.R