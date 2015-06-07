Sys.setlocale('LC_TIME', 'C')
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?")

hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %T")
hpc$Date <- as.Date(strptime(hpc$Date, format="%d/%m/%Y"))

hpcEx <- subset(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02" )

# Plot 2
png(filename="plot2.png", height=480, width=480)
plot(hpcEx$datetime, hpcEx$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()