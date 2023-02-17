# Set paths to project dir and file paths
pdir = "C:/Users/Desktop/Hobologger_transformCSV"
setwd(pdir)


# All packages needed for this script
list_packages <- c("tidyverse", "dplyr", "readxl", "openxlsx", "lubridate")
lapply(list_packages, library, character.only = TRUE)


# Set paths for the data
csv_folder = "./example/raw_csv/multiple/"
csv_fnames_ext_list = list.files(csv_folder, ".csv")


# Create dataframes for each csv file as tibble
csv_dframes <- lapply(csv_fnames_ext_list, function(x) {
  csv_file <- read_delim(
    file=paste(csv_folder,x,sep=""), skip=2, delim=",",
    col_names=c('index', 'DateTime', 'Temp_Celsius', 'Intensity_Lux'))
  
  csv_dframe <- csv_file %>%
    mutate(DateTime = parse_date_time(DateTime, "%m.%d.%y %I:%M:%S %p")) %>%
    separate(DateTime, c("Date", "Time"), sep=" ") %>%
    mutate(Date = as.Date(Date, format='%Y-%m-%d')) %>%
    select(-index)
})


# Creating name objects for exporting
csv_fnames_only <- tools::file_path_sans_ext(csv_fnames_ext_list)
csv_fnames_export = "./example/transformed_csv/multiple/"
csv_export_fnames = paste0(csv_fnames_only, "_transformed.csv", sep="")


# Loop over each tibble in the list and write it to a CSV file
for (i in seq_along(csv_dframes)) {
  filename <- file.path(csv_fnames_export, csv_export_fnames[i])
  write.csv(csv_dframes[[i]], file=filename, row.names=F)
}
