Sys.setlocale('LC_TIME', 'C')
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings= "?")

hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %T")
hpc$Date <- as.Date(strptime(hpc$Date, format="%d/%m/%Y"))

hpcEx <- subset(hpc, hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02" )

# Plot 3
png(filename="plot3.png", height=480, width=480)
plot(hpcEx$datetime, hpcEx$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(hpcEx$datetime, hpcEx$Sub_metering_2, type="l", col= "red")
lines(hpcEx$datetime, hpcEx$Sub_metering_3, type="l", col= "blue")
legend("topright", lty=c(1,1,1) ,col= c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()