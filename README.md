## Urban Productive Ecosystem | Transforming raw csv files from HOBO loggers

Github repository for the automatic process of transforming raw csv files from 
HOBO loggers into a new csv files that can be use to be saved on UPE/MfN urban 
garden project's GoogleDrive

### Prerequisites

R software and R Studio installed in your computer

### Installation

1. Clone or download (as zip) this repo
2. Navigate to the project folder 
3. Open the `Hobologger_transformCSV.Rproj` file in R Studio
4. Navigate to `scripts/` folder and open the `packagesInstaller.R` file
5. Change the path of the `pdir` string to the absolute path of where the 
`HOBOLoggers_transformCSV` folder is located on your computer
6. Run all the code in the `packagesInstaller.R` file (`Ctrl + Enter` each line)
7. Wait until all packages are installed and loaded

## Working with only one single raw HOBO csv file

1. Place your single raw HOBO csv file into the `raw_csv/single` folder 
2. Navigate to the `./scripts` folder and open the `transformCSV.R` file
3. Change the path of the `pdir` string to the absolute path where the 
`HOBOLoggers_transformCSV` folder is located on your computer
4. Run the codes then check `transformed_csv/single` folder to see the results 

## Working with multiple raw HOBO csv files

1. Place all the raw HOBO csv files into the `raw_csv/multiple` folder 
2. Navigate to the `./scripts` folder and open the `transformCSV_folder.R` file
3. Change the path of the `pdir` string to the absolute path where the 
`HOBOLoggers_transformCSV` folder is located on your computer
4. Run the codes then check `transformed_csv/multiple` folder to see the results 

## Example
Check out `example` folder for more details
