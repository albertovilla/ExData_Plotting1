Sys.setlocale('LC_TIME', 'C')
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?")

hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %T")
hpc$Date <- as.Date(strptime(hpc$Date, format="%d/%m/%Y"))

hpcEx <- subset(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02" )

# Plot 1
png(filename="plot1.png", height=480, width=480)
hist(hpcEx$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col= "red")
dev.off()
