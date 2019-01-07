library(data.table)
library(dplyr)
##We will use now readtable instead of file read to minimize somme problem of conversion
## the file will be directly unzipped in the working directory

chemin <- file.path(getwd(),"exdata_data_household_power_consumption","household_power_consumption.txt")

cols_name <- read.table(chemin, sep = ";", header = FALSE, nrows = 1, stringsAsFactors = FALSE) 

##table_hpc will be the table(dataset) learnt from the file 
table_hpc <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880, stringsAsFactors = FALSE, col.names = cols_name) 
table_hpc$Datetime <- strptime(paste(table_hpc$Date, table_hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

## Defining 2 rows and 2 colomn for the screen
png("plot4.png", width = 480, height = 480) 
par(mfrow = c(2, 2)) 

##Plotting
plot(table_hpc$Datetime, table_hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2) 
plot(table_hpc$Datetime, table_hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") 
plot(table_hpc$Datetime, table_hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(table_hpc$Datetime, table_hpc$Sub_metering_2, type = "l", col = "red") 
lines(table_hpc$Datetime, table_hpc$Sub_metering_3, type = "l", col = "blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o", box.col = "white") 
plot(table_hpc$Datetime, table_hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
dev.off() 