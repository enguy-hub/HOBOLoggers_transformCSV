# Set paths to your project dir
pdir = "C:/Users/Desktop/Hobologger_transformCSV"
setwd(pdir)

# Prerequisites - installing packages and load libraries
list_packages <- c("tidyverse", "dplyr", "readxl", "openxlsx", "lubridate")
install.packages(list_packages)