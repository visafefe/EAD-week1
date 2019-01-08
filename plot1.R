
library(data.table)
library(dplyr)

## the file will be directly unzipped in the working directory
chemin <- file.path(getwd(),"exdata_data_household_power_consumption","household_power_consumption.txt")

##table_hpc will be the table(dataset) learnt from the file
cols_name <- read.table(chemin, sep = ";", header = FALSE, nrows = 1, stringsAsFactors = FALSE)
table_hpc <- read.table(chemin, sep = ";", header = FALSE, skip = 66637, nrows = 2880, stringsAsFactors = FALSE, col.names = cols_name)
png('plot1.png', width = 480, height = 480) 
hist(table_hpc$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red') 
dev.off() 
