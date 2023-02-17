# Set paths to project dir and file paths
pdir = "C:/Users/Desktop/Hobologger_transformCSV"
setwd(pdir)


# All packages needed for this script
list_packages <- c("tidyverse", "dplyr", "readxl", "openxlsx", "lubridate")
lapply(list_packages, library, character.only = TRUE)


# Set paths for the data
csv_folder = "./example/raw_csv/single/"
csv_fname_ext = list.files(csv_folder, ".csv") # Should be only 1 file


# Reading the excel data files as dataframes
csv_file <- read_delim(
  file=paste(csv_folder,csv_fname_ext, sep=""), skip=2, delim=",",
  col_names=c('index', 'DateTime', 'Temp_Celsius', 'Intensity_Lux'))


# Create newly processed dataframes
csv_dframe <- csv_file %>%
  mutate(DateTime = parse_date_time(DateTime, "%m/%d/%y %I:%M:%S %p")) %>%
  separate(DateTime, c("Date", "Time"), sep = " ") %>%
  select(-index)


# Create name objects for exporting
csv_fname_only <- tools::file_path_sans_ext(csv_fname_ext)
csv_fname_export = paste0("./example/transformed_csv/single/", csv_fname_only, 
                          "_transformed.csv", sep="")


# Exporting new dataframes to excel files
write.csv(csv_dframe, csv_fname_export, row.names=F)
