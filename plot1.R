
library(data.table)
library(dplyr)

chemin <- file.path(getwd(),"exdata_data_household_power_consumption","household_power_consumption.txt")
table_hous_power_consumption <- fread(chemin)
table_num_hpc <- as.numeric(table_hous_power_consumption$Global_active_power)
png('plot1.png', width = 480, height = 480)
hist(table_num_hpc, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()