
library(data.table)
library(dplyr)
##We will use now readtable instead of file read to minimize somme problem of conversion
##table_hpc will be the table(dataset) learnt from the file 
## the file will be directly unzipped in the working directory

chemin <- file.path(getwd(),"exdata_data_household_power_consumption","household_power_consumption.txt")

cols_name <- read.table(chemin, sep = ";", header = FALSE, nrows = 1, stringsAsFactors = FALSE) 
table_hpc <- read.table(chemin, sep = ";", header = FALSE, skip = 66637, nrows = 2880, stringsAsFactors = FALSE, col.names = cols_name) 
table_hpc$Datetime <- strptime(paste(table_hpc$Date, table_hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width = 480, height = 480) 
plot(table_hpc$Datetime, table_hpc$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = "") 
lines(table_hpc$Datetime, table_hpc$Sub_metering_2, type = "l", col = "red") 
lines(table_hpc$Datetime, table_hpc$Sub_metering_3, type = "l", col = "blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue")) 
dev.off() 